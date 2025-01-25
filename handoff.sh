#!/usr/bin/env bash

# handoff: collect file contents and copy to clipboard
# usage: handoff file1 [file2 ...]
# note: checks for pbcopy (mac), xclip (linux), or wl-copy (wayland) to handle clipboard transfers

if [ -z "$*" ]; then
  echo "usage: $0 path1 [path2 ...]" >&2
  exit 1
fi

accumulated=""

for file in "$@"
do
  if [ ! -f "$file" ]; then
    echo "file not found: $file" >&2
    continue
  fi
  accumulated="${accumulated}${file}\n\`\`\`\n$(cat "$file")\n\`\`\`\n\n"
done

# choose a known clipboard command
if command -v pbcopy >/dev/null 2>&1; then
  echo -e "$accumulated" | pbcopy
elif command -v xclip >/dev/null 2>&1; then
  echo -e "$accumulated" | xclip -selection clipboard
elif command -v wl-copy >/dev/null 2>&1; then
  echo -e "$accumulated" | wl-copy
else
  echo "no supported clipboard command found (pbcopy, xclip, wl-copy)."
  exit 1
fi
