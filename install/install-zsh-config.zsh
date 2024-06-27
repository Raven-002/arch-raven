#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
if [ -f "~/.zshrc" ]; then
    if [ -f "~/.zshrc-original" ]; then
        exit 2;
    fi
    mv "~/.zshrc" "~/.zshrc-original"
fi

mkdir -p ~/.config
ln -srfT "$INSTALLER_DIR/config/zsh" "$HOME/.config/zsh"
export ZSH="$HOME/.config/zsh/oh-my-zsh"

[ -e "$ZSH" ] || sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
ln -srf "$HOME/.config/zsh/zshrc" "$HOME/.zshrc"
[ -f "$HOME/.p10k.zsh" ] || ln -sr "$HOME/.config/zsh/p10k.zsh" "$HOME/.p10k.zsh"
