#!/bin/bash

function code_backup() {
    code --list-extensions >>./config/code/extensions.txt
    cp ~/.config/Code/User/settings.json ./config/code/
}

function code_install() {
    sudo snap install code --classic
    cat ./config/code/extensions.txt | xargs -n 1 code --install-extension
    cp ./config/code/settings.json ~/.config/Code/User/
}

function code_uninstall() {
    code --list-extensions | xargs -n 1 code --uninstall-extension
}

echo "1. Backup vs-code extentions"
echo "2. install vs code extentions"
echo "3. uninstall vs code extentions"
read -p "Choose Action: " action
echo $action

if ((action == 1)); then
    code_backup
elif ((action == 2)); then
    code_install
elif ((action == 3)); then
    code_uninstall
else
    echo 'Invalid Action'
fi
