#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
yes_no_prompt "set nvim as git editor?" && git config --global core.editor nvim
yes_no_prompt "Install aur?" && "$INSTALLER_DIR/install/install-yay.zsh" && yay -S - < "$INSTALLER_DIR/pkglists/pkglist-aur"
yes_no_prompt "configure nix?" && "$INSTALLER_DIR/setup-nix.zsh"
yes_no_prompt "Install extra-nix-packages?" && "$INSTALLER_DIR/install-extra-nix-packages.zsh"
yes_no_prompt "Install zsh config?" && "$INSTALLER_DIR/install/install-zsh-config.zsh"
yes_no_prompt "Install kitty config?" && "$INSTALLER_DIR/install/install-kitty-config.zsh"
yes_no_prompt "Install nvim config?" && "$INSTALLER_DIR/install/install-nvim-config.zsh"
