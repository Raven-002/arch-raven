#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
mkdir -p ~/.config
ln -s "$INSTALLER_DIR/config/kitty" "$HOME/.config/kitty"
