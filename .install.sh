# Jack Vandemeulebroecke

set -e

echo ===== Installing sudo =====
apt install sudo

echo ===== Updating packages =====
yes | sudo apt update
yes | sudo apt upgrade
sudo apt-get update

echo ===== Installing Git =====
sudo apt install git

echo ===== Installing xclip =====
sudo apt-get install xclip

# Install Micro
echo ===== Installing Micro Editor =====
cd /usr/local/bin
curl https://getmic.ro | sudo bash
cd ~

echo ===== Installing Micro Plugins =====
micro -plugin install quoter

echo ===== Installing Docker =====
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# echo ===== Installing Autokey =====
# sudo apt install autokey-gtk

echo ===== Installing xbindkeys =====
sudo apt-get install xbindkeys

echo ===== Install Meld =====
sudo apt-get install meld

echo ===== Install Tree =====
sudo apt install tree

echo ===== Install Jump =====
wget https://github.com/gsamokovarov/jump/releases/download/v0.30.1/jump_0.30.1_amd64.deb && sudo dpkg -i jump_0.30.1_amd64.deb
rm jump_0.30.1_amd64.deb

echo ===== Install Node Version Manager =====
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo ===== Install latest version of NodeJS =====
nvm install node

echo ===== Installing node package manager =====
sudo apt install npm

echo ===== Install Prettier =====
sudo npm install --global prettier

# Set the source so changes to bashrc can be used in this terminal
source ~/.bashrc
echo ===== All done! =====

echo -e "\t\tAdditional downloads:"
echo -e "\thttps://code.visualstudio.com/docs/?dv=linux64_deb"
echo -e "\thttps://docs.docker.com/engine/install/ubuntu/"
