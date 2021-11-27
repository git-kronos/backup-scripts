#!/bin/bash

# private reps
function private_repos()
{
    git clone git@github.com:git-shuvam/recipe-app-api.git
    git clone git@github.com:git-shuvam/video-service.git
    git clone git@github.com:git-shuvam/report-app.git
    git clone git@github.com:git-shuvam/UserApp.git
    git clone git@github.com:git-shuvam/data-structure-with-flask.git
    git clone git@github.com:git-shuvam/django32.git
    git clone https://git-kronos:gitlab_passd@gitlab.com/my_apps1/backup.git
}

function office_repos()
{

    # git clone git@crescentek.com:Crescentek/cruise-api.git
    git clone git@crescentek.com:crescentek/hairdoo-backend.git
    git clone git@crescentek.com:superhero2007/edaider.git
    git clone https://bajjajjrajjesh:xapwe5-jyqryz-mEfnix@gitlab.com/cruise-labs/cruise-api.git
}

function new_repository_setup()
{
    # Create a new repository
    cd "backup"
    git switch -c main
    touch README.md
    git add README.md
    git commit -m "add README"
    git push -u origin main
}

function existing_folder_setup()
{
    # Push an existing folder
    cd "existing_folder"
    git init --initial-branch=main
    git remote add origin https://gitlab.com/my_apps1/backup.git
    git add .
    git commit -m "Initial commit"
    git push -u origin main
}

function existing_repo_setup()
{
    # Push an existing Git repository
    cd "existing_repo"
    git remote rename origin old-origin
    git remote add origin https://gitlab.com/my_apps1/backup.git
    git push -u origin --all
    git push -u origin --tags
}

# git config --global user.name "Shuvam Das" && git config --global user.email "repository.shuvam@gmail.com"
# git config user.name shuvam-crescentek && git config user.email git.shuvam@crescentek.com
