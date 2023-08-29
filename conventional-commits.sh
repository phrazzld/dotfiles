#!/bin/sh

# check if we are inside a git repo
git rev-parse --is-inside-work-tree > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "fatal: not a git repository (or any of the parent directories): .git."
  exit 1
fi

# check if we have any changes to commit
git diff-index --quiet --cached HEAD
if [ $? -eq 0 ]; then
  echo "fatal: no changes added to commit."
  exit 1
fi

TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
SCOPE=$(gum input --placeholder "scope")

# since the scope is optional, wrap it in parentheses if it has a value
test -n "$SCOPE" && SCOPE="($SCOPE)"

# pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "summary of this change")
DESCRIPTION=$(gum write --placeholder "details of this change (CTRL+D to finish)")

# commit these changes
echo "\ncommit preview:"
echo "-----------------"
echo "$SUMMARY"
echo "$DESCRIPTION"
echo "-----------------"
gum confirm "commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
