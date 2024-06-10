#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Script *********************************************
yes_no_prompt "Install aur?" && "$INSTALLER_DIR/install/setup-yay.zsh" && yay -S - < "$INSTALLER_DIR/pkglist/pkglist-aur"
yes_no_prompt "configure nix?" && "$INSTALLER_DIR/setup-nix.zsh"
yes_no_prompt "Install extra-nix-packages?" && "$INSTALLER_DIR/install-extra-nix-packages.zsh"
