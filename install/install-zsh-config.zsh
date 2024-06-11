#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
if [ -f "~/.zshrc" ]; then
    mv "~/.zshrc" "~/.zshrc-original"
fi

mkdir -p ~/.config
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s "$INSTALLER_DIR/config/zsh" "$HOME/.config/zsh"
ln -s "$HOME/.config/zsh/zshrc" "$HOME/.zshrc"
ln -s "$HOME/.config/zsh/p10k.zsh" "$HOME/.p10k.zsh"
