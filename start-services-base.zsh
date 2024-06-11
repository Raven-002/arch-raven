#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
systemctl enable bluetooth.service
systemctl enable NetworkManager.service
systemctl enable sshd.service

systemctl start bluetooth.service || true
systemctl start NetworkManager.service || true
systemctl start sshd.service || true
