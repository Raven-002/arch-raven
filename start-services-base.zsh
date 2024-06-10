#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Script *********************************************
systemctl enable --now bluetooth.service
systemctl enable --now NetworkManager.service
