#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
username="$1"
if [ -z "$username" ]; then
    exit 2
fi

useradd --create-home --shell "/bin/zsh" --groups "wheel,nix-users" "$username"
passwd "$username"
