#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Script *********************************************
mkdir /tmp/yay-install-dir
pushd /tmp/yay-install-dir

sudo pacman --color=always -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

popd

yay -S yay
yay --version
rm -rf /tmp/yay-install-dir
