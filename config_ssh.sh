#!/bin/bash


function set_ssh_key()
{
    cp ./config/ssh_keys/* ~/.ssh/
    chown $USER: ~/.ssh/*
    chmod 600 ~/.ssh/*
    chmod 644 ~/.ssh/*.pub
}

set_ssh_key