#!/bin/bash

function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

function random_quote() {
    # Path to the JSON file with quotes
    local json_file="$HOME/development/dotfiles/quotes.json"

    # Check if the file exists and is readable
    if [[ ! -r $json_file ]]; then
        echo "Unable to read the quotes file: $json_file" >&2
        return 1
    fi

    # Use jq to extract the quotes and randomly select one
    local selected_quote
    selected_quote=$(jq -c '.quotes[]' "$json_file" | shuf -n 1) || {
        echo "Failed to select a quote from the file: $json_file" >&2
        return 1
    }

    # echo "Selected quote:"
    # echo "$selected_quote"

    # Use jq again to format the selected quote and fold to wrap the text
    local content source
    content=$(echo "$selected_quote" | jq -r .content | fold -s -w 80)
    source=$(echo "$selected_quote" | jq -r .source)
    # Print the formatted quote
    echo -e "$content\n-- $source\n"
}

function vrg() {
    nvim $(rg -il "$1")
}

function clear_port() {
    if [ -z "$1" ]; then
        echo "Please specify a port number."
        return 1
    fi

    local PORT=$1
    local PID=$(lsof -i :$PORT | grep LISTEN | awk '{print $2}' | uniq)

    if [ -z "$PID" ]; then
        echo "No process found running on port $PORT."
        return 1
    fi

    echo "Killing process $PID on port $PORT."
    kill -9 $PID
    if [ $? -eq 0 ]; then
        echo "Process on port $PORT killed successfully."
    else
        echo "Failed to kill process on port $PORT."
    fi
}

function conventional_commit() {
    # check if we are inside a git repo
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
    if [ $? -ne 0 ]; then
      echo "fatal: not a git repository (or any of the parent directories): .git."
      return 1
    fi

    # check if we have any changes to commit
    git diff-index --quiet --cached HEAD
    if [ $? -eq 0 ]; then
      echo "fatal: no changes added to commit."
      return 1
    fi

    TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert" "ops")
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
}

# open all modified files in the current working tree
function modified() {
    git status --porcelain | awk '{print $2}' | xargs $EDITOR
}
