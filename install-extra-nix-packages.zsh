#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
nix-env -iA nixpkgs.vscode
