#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
whoami | grep -q root && echo "ERROR: Running with root" && exit 2

mkdir -p ~/.config
ln -srT "$INSTALLER_DIR/config/nixpkgs" "$HOME/.config/nixpkgs"

echo Enabling nix daemon
sudo -S systemctl enable nix-daemon.service
sudo -S systemctl start nix-daemon.service

echo Checking if user in group nix-users
groups | grep -q nix-users

echo Adding nix unstable channel
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

echo Testing hello package
nix-env -iA nixpkgs.hello
hello
nix-env --uninstall hello
