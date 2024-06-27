#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
if [ -f "~/.config/nvim" ]; then
    if [ -f "~/.config/nvim-original" ]; then
        exit 2;
    fi
    mv "~/.config/nvim" "~/.config/nvim-original"
fi


mkdir -p ~/.config
ln -sfT "$INSTALLER_DIR/config/nvim" "$HOME/.config/nvim"
