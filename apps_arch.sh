#!/bin/bash

BASEDIR=$(dirname "$0")
LOG_FiLE="./repo.log"
REPO_DiR="$BASEDIR/repos"

declare -a repos=(
    'https://aur.archlinux.org/anydesk-bin.git'
    'https://aur.archlinux.org/google-chrome.git'
    'https://aur.archlinux.org/pgadmin3.git'
    'https://aur.archlinux.org/postman-bin.git'
    'https://aur.archlinux.org/python36.git'
    'https://aur.archlinux.org/python37.git'
    'https://aur.archlinux.org/python38.git'
    'https://aur.archlinux.org/tableplus.git'
    'https://aur.archlinux.org/skypeforlinux-stable-bin.git'
    'https://aur.archlinux.org/snapd.git'
)

declare -a pacmanApps=(
    "libreoffice-still"
    "dconf-editor"
    "remmina"
    "vlc"
    "discord"
    "postgresql"
    "pgadmin4"
)

declare -a snapApps=(
    'code --classic'
    'postman'
)

postgres_config() {
    # Postgresql config
    sudo systemctl enable postgresql.service
    sudo systemctl start postgresql.service
    cat <<manuals
        # # sudo -iu postgres
        # initdb -D /var/lib/postgres/data
        # createuser --interactive
        sudo -u postgres createdb DB_NAME
        sudo -u postgres psql
        # > ALTER USER postgres WITH PASSWORD 'password';
manuals
}

: '
=============================
Aur Repos
=============================
'
function arch_repos() {
    if [[ ! -d $REPO_DiR ]]; then
        mkdir $REPO_DiR
    else
        sudo rm -r $REPO_DiR
    fi

    # # gpg keys for python37
    # gpg --keyserver keyserver.ubuntu.com --recv-key 0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
    # # gpg keys for python38
    # gpg --keyserver keyserver.ubuntu.com --recv-keys E3FF2839C048B25C084DEBE9B26995E310250568
    cd $REPO_DiR

    for repo in ${repos[@]}; do
        repo_dir=$(echo $repo | awk -F/ '{print $NF}' | awk -F. '{print $1}')
        git clone "$repo" &>>$LOG_FiLE
        cd "./$repo_dir"
        makepkg -si &>>log
        cd ..
    done
    exit 0
}

snap_config() {
    #
    # Snap Config
    #
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
}

install_app() {
    sudo pacman -Syu
    sudo pacman -S --needed base-devel

    # Arch apps
    for app in ${pacmanApps[@]}; do
        sudo pacman -S $app &>>$LOG_FiLE
    done

    arch_repos
    snap_config

    # Snap Apps
    for app in ${snapApps[@]}; do
        sudo snap install $app
    done
}

install_app
postgres_config
