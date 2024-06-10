#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Script *********************************************
whoami | grep -q root && echo "ERROR: Running with root" && exit 2

echo Enabling nix daemon
sudo systemctl enable --now nix-daemon.service

echo Checking if user in group nix-users
groups | grep -q nix-users

echo Adding nix unstable channel
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

echo Testing hello package
nix-env -iA nixpkgs.hello
hello
nix-env --uninstall hello
