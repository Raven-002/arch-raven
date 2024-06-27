#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}"
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Functions ******************************************
function install_from_file()
{
    [ -f "$1" ] && pacman --color=always -Sy --needed - < "$1"
}


# *** Script *********************************************
# install packages
tmp_package_list_path="/tmp/tmp_arch_install_packages_list.txt"
echo "pacman" > "$tmp_package_list_path"
yes_no_prompt "Install base?" && cat "$INSTALLER_DIR/pkglists/pkglist-base" >> "$tmp_package_list_path"
yes_no_prompt "Install fonts?" && cat "$INSTALLER_DIR/pkglists/pkglist-fonts" >> "$tmp_package_list_path"
yes_no_prompt "Install kde?" && cat "$INSTALLER_DIR/pkglists/pkglist-kde" >> "$tmp_package_list_path"
yes_no_prompt "Install intel?" && cat "$INSTALLER_DIR/pkglists/pkglist-intel" >> "$tmp_package_list_path"
yes_no_prompt "Install nvidia?" && cat "$INSTALLER_DIR/pkglists/pkglist-nvidia" >> "$tmp_package_list_path"
yes_no_prompt "Install extra?" && cat "$INSTALLER_DIR/pkglists/pkglist-extra" >> "$tmp_package_list_path"
install_from_file "$tmp_package_list_path"
yes_no_prompt "Start basic servieces?" && "$INSTALLER_DIR/start-services-base.zsh"

if yes_no_prompt "Configure sudo for wheel group?"; then
    if yes_no_prompt "Should wheel users enter a password when using sudo?"; then
        sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' "/etc/sudoers"
    else
        sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD :ALL/' "/etc/sudoers"
    fi
fi

read_prompt "Main User[Empty to skip this]"
if ! [ -z "$_prompt_result" ]; then
    user_name=$_prompt_result
    read_prompt "dotfiles path[Empty='.dotfiles']"
    [ -z "$_prompt_result" ] && export _prompt_result=".dotfiles"
    dotfiles_location="/home/$user_name/$_prompt_result"

    "$INSTALLER_DIR/add-main-user.zsh" $user_name
    cp -r "$INSTALLER_DIR" "$dotfiles_location"
    chown $user_name:$user_name -R "$dotfiles_location"
    su $user_name -c "$dotfiles_location/install/user-install.zsh"
fi

