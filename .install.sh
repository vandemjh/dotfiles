#!/bin/bash

# Jack Vandemeulebroecke

set -e

failed_commands=()

echo ===== Installing sudo =====
if ! apt install sudo; then
    failed_commands+=("sudo")
fi

echo ===== Updating packages =====
if ! (yes | sudo apt update && yes | sudo apt upgrade && sudo apt-get update); then
    failed_commands+=("package updates")
fi

echo ===== Installing Git =====
if ! sudo apt install git; then
    failed_commands+=("git")
fi

echo ===== Installing xclip =====
if ! sudo apt-get install xclip; then
    failed_commands+=("xclip")
fi

# Install Micro
echo ===== Installing Micro Editor =====
cd /usr/local/bin
if ! curl https://getmic.ro | sudo bash; then
    failed_commands+=("Micro Editor installation")
fi
cd ~

echo ===== Installing Micro Plugins =====
if ! micro -plugin install quoter; then
    failed_commands+=("Micro Plugins installation")
fi

echo ===== Installing Docker =====
if ! (sudo apt install docker.io && sudo groupadd docker && sudo usermod -aG docker $USER && newgrp docker); then
    failed_commands+=("Docker installation")
fi

# echo ===== Installing Autokey =====
# if ! sudo apt install autokey-gtk; then
#     failed_commands+=("Autokey installation")
# fi

echo ===== Installing xbindkeys =====
if ! sudo apt-get install xbindkeys; then
    failed_commands+=("xbindkeys")
fi

echo ===== Install Meld =====
if ! sudo apt-get install meld; then
    failed_commands+=("Meld installation")
fi

echo ===== Install Tree =====
if ! sudo apt install tree; then
    failed_commands+=("Tree installation")
fi

echo ===== Install Jump =====
if ! (wget https://github.com/gsamokovarov/jump/releases/download/v0.30.1/jump_0.30.1_amd64.deb && sudo dpkg -i jump_0.30.1_amd64.deb && rm jump_0.30.1_amd64.deb); then
    failed_commands+=("Jump installation")
fi

echo ===== Install Node Version Manager =====
if ! (curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash); then
    failed_commands+=("Node Version Manager installation")
fi

echo ===== Install latest version of NodeJS =====
if ! nvm install node; then
    failed_commands+=("NodeJS installation")
fi

echo ===== Installing node package manager =====
if ! sudo apt install npm; then
    failed_commands+=("Node package manager installation")
fi

echo ===== Install Prettier =====
if ! sudo npm install --global prettier; then
    failed_commands+=("Prettier installation")
fi

# Set the source so changes to bashrc can be used in this terminal
source ~/.bashrc
echo ===== All done! =====

# Printing failed commands, if any
if [ ${#failed_commands[@]} -gt 0 ]; then
    echo -e "\nFailed commands:"
    for failed_cmd in "${failed_commands[@]}"; do
        echo "- $failed_cmd"
    done
fi

echo -e "\n\t\tAdditional downloads:"
echo -e "\thttps://code.visualstudio.com/docs/?dv=linux64_deb"
echo -e "\thttps://docs.docker.com/engine/install/ubuntu/"
