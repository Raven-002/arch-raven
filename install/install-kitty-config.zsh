#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/../.."
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Script *********************************************
ln -s "$INSTALLER_DIR/config/kitty" "~/.config/kitty"
