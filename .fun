#!/bin/bash

# Functions
pullpasses() {
    if [ -n "$1" ]; then
        lpass show $(lpass ls | grep -i "$1" | awk '{ print $3 }' | sed 's/.$//')
    else
        echo "Error: missing search term"
    fi
}

pullpass() {
    if [ -n "$1" ]; then
        pullpasses "$1" | grep -i "Password:" | awk '{ print $2 }' | head -1 | pbcopy
    else
        echo "Error: missing search term"
    fi
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Encrypt directories
# first arg: tarfile name
# second arg: directory to encrypt
lock() {
    TARFILE=$1
    TARGET_DIR=$2
    tar czf $TARFILE $TARGET_DIR
    gpg -c $TARFILE
    echo "Remember: remove $TARFILE and $TARGET_DIR"
}

# Decrypt archives
# first arg: tarfile name
# second arg: gpg file name
unlock() {
    TARFILE=$1
    GPGFILE=$2
    gpg --output $TARFILE $GPGFILE
    tar xzf $TARFILE
}

ALACRITTY_CONFIG="$DEVELOPMENT/dotfiles/alacritty.yml"
ALACRITTY_THEME_PATH="/Users/phaedrus/Development/dotfiles/alacritty-themes"

golight() {
    sed -i '' "s|^  - $ALACRITTY_THEME_PATH/.*|  - $ALACRITTY_THEME_PATH/rose-pine-dawn.yml|" $ALACRITTY_CONFIG
}

godark() {
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
