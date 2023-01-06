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

golight() {
    ORIGINAL_NODE_VERSION=$(asdf current nodejs | awk '{ print $2 }')

    asdf local nodejs 17.9.1

    alacritty-themes github_light_default

    # If original node version doesn't exist, use latest
    if [ -z "$ORIGINAL_NODE_VERSION" ]; then
        asdf local nodejs $(asdf latest nodejs)
    else
        asdf local nodejs $ORIGINAL_NODE_VERSION
    fi
}

godark() {
    ORIGINAL_NODE_VERSION=$(asdf current nodejs | awk '{ print $2 }')

    asdf local nodejs 17.9.1

    alacritty-themes Catppuccin

    # If original node version doesn't exist, use latest
    if [ -z "$ORIGINAL_NODE_VERSION" ]; then
        asdf local nodejs $(asdf latest nodejs)
    else
        asdf local nodejs $ORIGINAL_NODE_VERSION
    fi
}
