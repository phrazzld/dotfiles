#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$ROOT_DIR/config/hosts/mirrodin/sudoers.d/zz-workbench-phaedrus"
TARGET_DIR=/etc/sudoers.d
TARGET="$TARGET_DIR/zz-workbench-phaedrus"
APPLY=false

usage() {
  cat <<'EOF'
Usage: scripts/setup-privileges.sh [--apply]

Mirrodin only. The default validates the source and prints a read-only plan.
--apply uses sudo when needed, or accepts an already privileged caller.
Installs full passwordless sudo for phaedrus as a root:root, mode 0440 copy.
This grants root to every process under the account, not only agents.
Existing conflicting content, symlinks, and incorrect metadata are refused.
Other sudoers files and SSH authentication are unchanged.
EOF
}

fail() {
  printf 'setup-privileges: %s\n' "$*" >&2
  exit 1
}

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --apply) APPLY=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'Unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ "$(uname -s)" == Linux && "$(hostname -s)" == mirrodin ]] ||
  fail "This policy is only for the Linux host mirrodin."
[[ -f "$SOURCE" && ! -L "$SOURCE" ]] || fail "Expected a regular source file: $SOURCE"
visudo -c -f "$SOURCE" || fail "Source policy is invalid; no changes made."

printf 'Source: %s\nTarget: %s\n' "$SOURCE" "$TARGET"
if [[ "$APPLY" != true ]]; then
  printf 'Plan only: grant phaedrus full passwordless sudo on mirrodin. No changes made.\n'
  exit 0
fi
if [[ "$EUID" -ne 0 ]]; then
  exec sudo -- /usr/bin/bash "$ROOT_DIR/scripts/setup-privileges.sh" --apply
fi

[[ -d "$TARGET_DIR" && ! -L "$TARGET_DIR" ]] || fail "Expected a non-symlink directory: $TARGET_DIR"
id phaedrus >/dev/null || fail "The phaedrus account does not exist."
visudo -c || fail "Existing sudoers policy is invalid; no changes made."
[[ ! -L "$TARGET" ]] || fail "Refusing symlink: $TARGET"
if [[ -e "$TARGET" ]]; then
  [[ -f "$TARGET" ]] && cmp -s -- "$SOURCE" "$TARGET" ||
    fail "Conflicting content at $TARGET; review it manually."
  [[ "$(stat -c '%u:%g:%a' -- "$TARGET")" == 0:0:440 ]] ||
    fail "Incorrect ownership/mode at $TARGET; expected root:root 0440."
  printf 'Privilege policy already matches (root:root, mode 0440).\n'
  exit 0
fi

# Dotted staging names are ignored by sudoers @includedir.
STAGED="$(mktemp "$TARGET_DIR/.workbench-privileges.XXXXXX")"
trap 'rm -f -- "$STAGED"' EXIT
install -o root -g root -m 0440 -- "$SOURCE" "$STAGED"
visudo -c -f "$STAGED" || fail "Staged policy is invalid; no grant installed."
cmp -s -- "$SOURCE" "$STAGED" || fail "Source changed during staging; no grant installed."
# Atomic creation must not replace a file created after the preflight.
ln -T -- "$STAGED" "$TARGET" || fail "Cannot create $TARGET; inspect for a concurrent change."
if ! visudo -c; then
  [[ "$TARGET" -ef "$STAGED" ]] || fail "Validation failed and target changed; inspect $TARGET manually."
  rm -- "$TARGET"
  fail "Combined policy validation failed; removed the new grant."
fi
printf 'Installed full unattended administration for phaedrus on mirrodin (root:root, mode 0440).\n'
