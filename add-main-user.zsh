#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Script *********************************************
username="$1"
![ -z "$username" ]

useradd --create-home --shell "/bin/zsh" --groups "wheel,nix-users" "$username"
passwd "$username"
