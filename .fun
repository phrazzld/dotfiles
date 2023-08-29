#!/bin/bash

function pullpasses() {
    if [ -n "$1" ]; then
        lpass show $(lpass ls | grep -i "$1" | awk '{ print $3 }' | sed 's/.$//')
    else
        echo "Error: missing search term"
    fi
}

function pullpass() {
    if [ -n "$1" ]; then
        pullpasses "$1" | grep -i "Password:" | awk '{ print $2 }' | head -1 | pbcopy
    else
        echo "Error: missing search term"
    fi
}

function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Encrypt directories
# first arg: tarfile name
# second arg: directory to encrypt
function lock() {
    TARFILE=$1
    TARGET_DIR=$2
    tar czf $TARFILE $TARGET_DIR
    gpg -c $TARFILE
    echo "Remember: remove $TARFILE and $TARGET_DIR"
}

# Decrypt archives
# first arg: tarfile name
# second arg: gpg file name
function unlock() {
    TARFILE=$1
    GPGFILE=$2
    gpg --output $TARFILE $GPGFILE
    tar xzf $TARFILE
}

ALACRITTY_CONFIG="$DEVELOPMENT/dotfiles/alacritty.yml"
ALACRITTY_THEME_PATH="/Users/phaedrus/Development/dotfiles/alacritty-themes"

function golight() {
    sed -i '' "s|^  - $ALACRITTY_THEME_PATH/.*|  - $ALACRITTY_THEME_PATH/rose-pine-dawn.yml|" $ALACRITTY_CONFIG
}

function godark() {
    sed -i '' "s|^  - $ALACRITTY_THEME_PATH/.*|  - $ALACRITTY_THEME_PATH/rose-pine.yml|" $ALACRITTY_CONFIG
}

function random_quote() {
    # Path to the JSON file with quotes
    local json_file="$DEVELOPMENT/dotfiles/quotes.json"

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

    # Use jq again to format the selected quote and fold to wrap the text
    local content source
    content=$(echo "$selected_quote" | jq -r .content | fold -s -w 80)
    source=$(echo "$selected_quote" | jq -r .source)
    # Print the formatted quote
    echo -e "$content\n-- $source"
}

function vrg() {
    $NEOVIM $(rg -il "$1")
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
}

# open all modified files in the current working tree
function modified() {
    git status --porcelain | awk '{print $2}' | xargs $EDITOR
}
