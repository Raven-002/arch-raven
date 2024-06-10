#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/../.."
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Script *********************************************
if [ -f "~/.zshrc" ]; then
    mv "~/.zshrc" "~/.zshrc-original"
fi

ln -s "$INSTALLER_DIR/config/zsh" "~/.config/zsh"
ls -s "~/.config/zsh/zshrc" "~/.zshrc"
ls -s "~/.config/zsh/p10k.zsh" "~/.p10k.zsh"
