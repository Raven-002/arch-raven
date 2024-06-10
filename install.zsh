#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-uils.zsh"

# *** Functions ******************************************
function install_from_file()
{
    [ -f "$1" ] && pacman --color=always -Sy --needed - < "$1"
}


# *** Script *********************************************
# install packages
tmp_package_list_path="/tmp/tmp_arch_install_packages_list.txt"
print "" > "$tmp_package_list_path"
yes_no_prompt "Install base?" && cat "$INSTALLER_DIR/pkglist/pkglist-base" >> "$tmp_package_list_path"
yes_no_prompt "Install fonts?" && cat "$INSTALLER_DIR/pkglis/pkglist-fonts" >> "$tmp_package_list_path"
yes_no_prompt "Install kde?" && cat "$INSTALLER_DIR/pkglis/pkglist-kde" >> "$tmp_package_list_path"
yes_no_prompt "Install intel?" && cat "$INSTALLER_DIR/pkglis/pkglist-intel" >> "$tmp_package_list_path"
yes_no_prompt "Install nvidia?" && cat "$INSTALLER_DIR/pkglis/pkglist-nvidia" >> "$tmp_package_list_path"
yes_no_prompt "Install extra?" && cat "$INSTALLER_DIR/pkglis/pkglist-extra" >> "$tmp_package_list_path"
install_from_file "$tmp_package_list_path"
yes_no_prompt "Start basic servieces?" && "$INSTALLER_DIR/start-services-base.zsh"

read_prompt "Main User[Empty to skip this]"
if ! [ -z "$_prompt_result" ]; then
    user_name=$_prompt_result
    "$INSTALLER_DIR/add-main-user.zsh" $user_name
    su $user_name -c "$INSTALLER_DIR/install/user-install.zsh"
fi

