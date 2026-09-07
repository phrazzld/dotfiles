#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$ROOT_DIR/config/hosts/mirrodin/sysctl.d/60-workbench-recovery.conf"
TARGET_DIR=/etc/sysctl.d
TARGET="$TARGET_DIR/60-workbench-recovery.conf"
APPLY=false

usage() {
  cat <<'EOF'
Usage: scripts/setup-recovery.sh [--apply]

Linux only. The default is a read-only plan; it never requests privilege.
--apply uses sudo when needed to install a root:root, mode 0644 file at
/etc/sysctl.d/60-workbench-recovery.conf and activate kernel.sysrq=176 only.
Run --apply from an interactive terminal, or run it as root. Existing target
content must match the repository source exactly; symlinks are refused.
There is no automatic adoption or modification of other sysctl files.

Emergency keyboard sequence: Alt+SysRq+S (sync), then U (remount read-only),
then B (reboot). Wait for sync and remount completion before the next key.
This is S/U/B, not full REISUB or guaranteed GPU recovery; the kernel and
keyboard must still respond. Mask 176 enables sync, remount, and reboot/poweroff.
Emergency reboot loses unsaved work and allows physical-access denial of
service, even while locked. This installer never reboots or bypasses locking.
EOF
}

fail() {
  printf 'setup-recovery: %s\n' "$*" >&2
  exit 1
}

validate_settings() {
  local file="$1" line settings=0
  [[ -f "$file" && -r "$file" && ! -L "$file" ]] || fail "Expected a readable regular file: $file"
  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" =~ ^[[:space:]]*(#.*)?$ ]]; then
      continue
    fi
    [[ "$line" =~ ^[[:space:]]*kernel[.]sysrq[[:space:]]*=[[:space:]]*176[[:space:]]*$ ]] ||
      fail "Unexpected content in $file; only kernel.sysrq=176 and comments are allowed."
    settings=$((settings + 1))
  done < "$file"
  [[ "$settings" -eq 1 ]] || fail "Expected exactly one kernel.sysrq=176 setting in $file."
}

check_target() {
  [[ ! -L "$TARGET" ]] || fail "Refusing symlink: $TARGET. Review and move it aside manually before applying."
  if [[ -e "$TARGET" ]]; then
    [[ -f "$TARGET" && -r "$TARGET" ]] || fail "Cannot inspect a regular file at $TARGET; refusing to replace it."
    cmp -s -- "$SOURCE" "$TARGET" ||
      fail "Conflicting content in $TARGET. Review and back it up/move it aside manually; no changes were made to it."
  fi
}

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --apply) APPLY=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'Unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ "$(uname -s)" == Linux ]] || fail "This recovery setup is Linux-only."
for dependency in sysctl cmp stat; do
  command -v "$dependency" >/dev/null 2>&1 || fail "Required command not found: $dependency"
done
[[ -d "$TARGET_DIR" && ! -L "$TARGET_DIR" ]] || fail "Expected an existing, non-symlink directory: $TARGET_DIR"
validate_settings "$SOURCE"
check_target
CURRENT="$(sysctl -n kernel.sysrq)" || fail "Cannot read kernel.sysrq; no changes were made."
[[ "$CURRENT" =~ ^[0-9]+$ ]] || fail "Unexpected kernel.sysrq value: $CURRENT"
METADATA=absent
if [[ -e "$TARGET" ]]; then
  METADATA="$(stat -c '%u:%g:%a' -- "$TARGET")" || fail "Cannot inspect ownership/mode of $TARGET."
fi

if [[ "$APPLY" == true && "$EUID" -ne 0 ]]; then
  command -v sudo >/dev/null 2>&1 || fail "--apply requires root; install sudo separately or run this script as root."
  exec sudo -- /usr/bin/bash "$ROOT_DIR/scripts/setup-recovery.sh" --apply
fi

printf 'Source: %s\nTarget: %s\n' "$SOURCE" "$TARGET"
if [[ "$METADATA" == 0:0:644 ]]; then
  printf 'Persisted file already matches (root:root, mode 0644).\n'
else
  printf 'Would install matching content as root:root, mode 0644 (current uid:gid:mode: %s).\n' "$METADATA"
fi
printf 'Effective kernel.sysrq: %s; requested: 176 (S/U/B recovery).\n' "$CURRENT"
if [[ "$APPLY" != true ]]; then
  printf 'Plan only. No changes made. Re-run with --apply to persist and activate this setting only.\n'
  exit 0
fi

if [[ "$METADATA" != 0:0:644 ]]; then
  STAGED="$(mktemp "$TARGET_DIR/.workbench-recovery.XXXXXX")" || fail "Cannot stage a file in $TARGET_DIR."
  trap 'rm -f -- "$STAGED"' EXIT
  install -o root -g root -m 0644 -- "$SOURCE" "$STAGED" || fail "Could not stage $TARGET; no sysctl settings were loaded."
  validate_settings "$STAGED"
  cmp -s -- "$SOURCE" "$STAGED" || fail "Source changed while staging; rerun after the source is stable."
  check_target
  if [[ -e "$TARGET" ]]; then
    mv -T -- "$STAGED" "$TARGET" || fail "Could not install $TARGET; no sysctl settings were loaded."
  else
    # A concurrent creator must not be overwritten, even after the preflight.
    ln -- "$STAGED" "$TARGET" || fail "Could not create $TARGET (it may have appeared concurrently); inspect it and rerun."
    rm -f -- "$STAGED"
  fi
  trap - EXIT
  printf 'Installed %s (root:root, mode 0644).\n' "$TARGET"
fi

if [[ "$CURRENT" != 176 ]]; then
  sysctl --load="$TARGET" || fail "Persisted $TARGET, but activation failed. Inspect the sysctl error and rerun --apply; no other sysctl files were loaded."
fi
ACTIVE="$(sysctl -n kernel.sysrq)" || fail "Persisted $TARGET, but could not verify effective kernel.sysrq."
[[ "$ACTIVE" == 176 ]] || fail "Persisted $TARGET, but effective kernel.sysrq is $ACTIVE, not 176; another writer may be overriding it."
printf 'Recovery setting is persisted and active: kernel.sysrq=176. No reboot was performed.\n'
