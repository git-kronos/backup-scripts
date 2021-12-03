#!/bin/bash

function package_install() {
    # $1 is for repository name,
    # $2 is package list
    for package in $2; do
        sudo $1 install -y $package
    done
}

function refresh() {
    echo "======================Refresh starts======================"
    case $1 in
    1)
        sudo apt update
        ;;
    2)
        sudo apt update && sudo apt upgrade
        ;;
    3)
        sudo apt update && sudo apt upgrade && sudo apt autoremove
        ;;
    *)
        echo "Wrong option"
        ;;
    esac

    sudo apt install -f # sudo apt --fix-broken install
    echo "======================Refresh Ends======================"
}

# packages
function anydesk() {
    wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
    echo "deb http://deb.anydesk.com/ all main" >/etc/apt/sources.list.d/anydesk-stable.list
    apt update
    apt install anydesk
}

function docker() {
    sudo apt-get update
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    refresh 1 # sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    echo "=================================="
    echo "docker compose"
    echo "=================================="
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

function postgresql() {
    sudo apt-get install -y wget ca-certificates
    sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    refresh 1 # sudo apt-get update
    sudo apt-get -y install postgresql postgresql-contrib
}

function pgadmin4() {
    sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
    sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
    sudo apt install -y pgadmin4-desktop
}

function tableplus() {
    wget -qO - http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
    sudo apt update
    sudo apt install tableplus -y
}

echo "*******************installtion start*******************"
essential_apps=(
    build-essential,
    curl,
    preload,
    ubuntu-restricted-extras,
    vlc
)

snap_packages=(
    'skype'
    'postman'
    'pycharm-professional --channel=2019.3/stable --classic'
)

extra_apps=(
    timeshift
    gnome-tweaks
    rabbitmq-server
    neofetch
    dconf-editor
    software-properties-common
    gettext
    libpq-dev
    libxmlsec1-dev
    fonts-firacode
    # ===============vlc addon===============
    vlc-plugin-access-extra
    libbluray-bdj
    libdvdcss2
    # ===============vlc addon===============
)

python_packages=(
    python3-autopep8
    python3-isort
    python3-pip
    python3.6
    python3.6-venv
    python3.7
    python3.7-venv
    python3.9
    python3.9-venv
    python3.10
    python3.10-venv
)

apt_get_packages=(
    nodejs
)

refresh 1
package_install 'apt' $essential_apps
package_install 'snap' $snap_packages
echo "======================================"
echo "Development Packages Needed"
echo "======================================"
echo "python"
sudo apt install software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
package_install 'apt' $python_packages

echo "nodejs"
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
package_install 'apt-get' $apt_get_packages

echo "DB"
postgresql
echo "DB Support"
pgadmin4
tableplus
echo "Virtualisation supports"
docker

<<ManualJobs
Skipping these process for Manual Installations
======================================
Postgres password setup
--------------------------------------
sudo -u postgres createdb DB_NAME
sudo service postgresql start
sudo -u postgres psql
> ALTER USER postgres WITH PASSWORD 'password';
--------------------------------------
Misc
--------------------------------------
https://ohmybash.nntoan.com/
# sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
 https://github.com/JetBrains/JetBrainsMono
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
--------------------------------------
 vlc backup
--------------------------------------
# cp ./config/vlc/* ~/.config/vlc/
--------------------------------------
Skipping anydesk installation
Manual install needed ...
anydesk
root access needed
--------------------------------------
wget https://download.virtualbox.org/virtualbox/6.1.30/virtualbox-6.1_6.1.30-148432~Ubuntu~eoan_amd64.deb
sudo apt install ./virtualbox-6.1_6.1.30-148432~Ubuntu~eoan_amd64.deb
rm ./virtualbox-6.1_6.1.30-148432~Ubuntu~eoan_amd64.deb
======================================
ManualJobs
refresh 2
