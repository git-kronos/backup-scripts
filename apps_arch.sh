# !bin/bash


# =============================
# Arch apps
# =============================
sudo pacman -Syu
sudo pacman -S --needed base-devel
# =============================
# Pacman Apps
# =============================
sudo pacman -S libreoffice-still dconf-editor remmina vlc discord
# sudo pacman -S pgadmin4

# =============================
# Postgresql config
# =============================
sudo pacman -S postgresql
# # sudo -iu postgres
# # initdb -D /var/lib/postgres/data
# # createuser --interactive
# sudo systemctl enable postgresql.service
# sudo systemctl start postgresql.service

# =============================
# Snap Config
# =============================
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# =============================
# Snap Apps
# =============================
sudo snap install code --classic


# =============================
# Aur Repos
# =============================
function arch_repos()
{
    #
    # FOR REFERENCE
    #
    # input="./repo.txt"
    # while IFS= read -r line
    # do
    # git clone $line
    # done < "$input"
    #
    # for D in ./*; do
    #     if [ -d "$D" ]; then
    #         cd "$D"
    #         yes | makepkg -si
    #         cd ..
    #     fi
    # done
    #

    declare -a repos=(
        'https://aur.archlinux.org/snapd.git'
        'https://aur.archlinux.org/anydesk-bin.git'
        'https://aur.archlinux.org/postman-bin.git'
        'https://aur.archlinux.org/google-chrome.git'
        'https://aur.archlinux.org/skypeforlinux-stable-bin.git'
        'https://aur.archlinux.org/python38.git'
        'https://aur.archlinux.org/python37.git'
        'https://aur.archlinux.org/python36.git'
        'https://aur.archlinux.org/tableplus.git'
        'https://aur.archlinux.org/pgadmin3.git'
    )
    # # gpg keys for python37
    # gpg --keyserver keyserver.ubuntu.com --recv-key 0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
    # # gpg keys for python38
    # gpg --keyserver keyserver.ubuntu.com --recv-keys E3FF2839C048B25C084DEBE9B26995E310250568

    for repo in ${repos[@]}; do
        echo $repo
        # git clone $repo
        # # cd into directory
        # cd $repo
        # # run:
        # yes | makepkg -si
    done
}
# arch_repos