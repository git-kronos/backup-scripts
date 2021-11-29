# !/bin/bash

# Development packages
function python()
{
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa -y

    sudo apt install -y python3-autopep8 python3-isort python3-pip
    sudo apt install -y python3.6 python3.6-venv \
                        python3.7 python3.7-venv \
                        python3.9 python3.9-venv \
                        python3.10 python3.10-venv
}

function nodejs()
{
    # v16 LTS
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
    # # v17
    # curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
    # sudo apt-get install -y nodejs
    # # v16
    # curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    # sudo apt-get install -y nodejs
    # # v14
    # curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    # sudo apt-get install -y nodejs
    # # v12
    # curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    # sudo apt-get install -y nodejs
}

function postgresql()
{
    sudo apt-get install -y wget ca-certificates
    sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get -y install postgresql postgresql-contrib
}

function pgadmin4()
{
    sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
    sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
    sudo apt install -y pgadmin4-desktop
}

function docker()
{
    sudo apt-get update
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    echo "=================================="
    echo "docker compose"
    echo "=================================="
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

# packages
function anydesk()
{
    wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
    echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
    apt update
    apt install anydesk
}

function tableplus()
{
    wget -qO - http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
    sudo apt update
    sudo apt install tableplus -y
}

echo "*******************installtion start*******************"
echo "Essessantial App"
sudo apt -y install git \
                    build-essential \
                    curl \
                    preload \
                    ubuntu-restricted-extras \
                    vlc

sudo snap install skype postman
sudo snap install pycharm-professional --channel=2019.3/stable --classic

echo "======================================"
echo "Development Packages Needed"
echo "======================================"
echo "Language supports"
python
nodejs
echo "DB"
postgresql
echo "DB Support"
pgadmin4
tableplus
echo "Virtualisation supports"
docker

clear && sudo apt update && sudo apt upgrade && sudo apt autoremove

echo "======================================"
echo "Skipping anydesk installation"
echo "Manual install needed ..."
echo "anydesk"
echo "root access needed"
echo "======================================"
sudo apt update && sudo apt upgrade && sudo apt autoremove
sudo apt --fix-broken install
#
# # ======================================
# # Apt Repositories
# # ======================================
# timeshift
# gnome-tweaks
# rabbitmq-server
# neofetch
# dconf-editor
# software-properties-common
# gettext
# libpq-dev
# libxmlsec1-dev
#
# # ======================================
# # vlc requirements(apt package)
# # ======================================
#
# vlc-plugin-access-extra
# libbluray-bdj
# libdvdcss2
# cp ./config/vlc/* ~/.config/vlc/
#
# # ======================================
# # Postgres password setup
# # ======================================
# sudo -u postgres createdb DB_NAME
# sudo service postgresql start
# sudo -u postgres psql
# > ALTER USER postgres WITH PASSWORD 'password';
# # ======================================
#
# # ======================================
# # Extra
# # ======================================
#
# sudo apt -y install zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# sudo apt -y install fonts-firacode
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
# # ======================================
#