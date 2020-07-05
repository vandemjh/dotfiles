# Jack Vandemeulebroecke
echo ===== Installing Git =====
sudo apt install git

echo ===== Updating packages =====
sudo apt-get update

echo ===== Installing xclip =====
sudo apt-get install xclip

# Opted for autokey
# echo ===== Installing xdotool =====
# sudo apt-get install xdotool

echo ===== Installing Autokey =====
sudo apt install autokey-gtk

echo ===== Installing xbindkeys =====
sudo apt-get install xbindkeys

# Create projects directory
echo ===== Creating project directory =====
mkdir ~/Desktop/Projects

echo ===== Updating Git repos in Projects Directory  =====
cd ~/Desktop/Projects
find . -maxdepth 3 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} pull
cd ~

# Download Git bash prompt
echo ===== Downloading Git-bash-prompt =====
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Get googler
echo ===== Downloading googler =====
sudo curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v4.0/googler && sudo chmod +x /usr/local/bin/googler

# Get taskwarrior
echo ===== Downloading taskwarrior ====
sudo apt install taskwarrior

# Get desk
echo ===== Downloading Desk ====
sudo bash -c 'curl https://raw.githubusercontent.com/jamesob/desk/master/desk > /usr/local/bin/desk'
sudo chmod +x /usr/local/bin/desk
cd

# Install Micro
echo ===== Installing Micro Editor =====
cd /usr/local/bin
curl https://getmic.ro | sudo bash
cd ~

echo ===== Installing Micro Plugins =====
micro -plugin install quoter

echo ===== Install Meld =====
sudo apt-get install meld

echo ===== Install Jump =====
wget https://github.com/gsamokovarov/jump/releases/download/v0.30.1/jump_0.30.1_amd64.deb && sudo dpkg -i jump_0.30.1_amd64.deb
rm jump_0.30.1_amd64.deb

echo ===== Install Node Version Manager =====
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo ===== Install latest version of NodeJS =====
nvm install -y node

echo ===== Installing node package manager =====
sudo apt install -y npm

echo ===== Install Prettier =====
sudo npm install --global prettier

echo ===== Install Live-Server =====
sudo npm install --global live-server

echo ===== Install Spotify  =====
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Set the source so changes to bashrc can be used in this terminal
source ~/.bashrc
echo ===== All done! =====

echo -e "\t\tAdditional downloads:"
echo -e "\thttps://code.visualstudio.com/docs/?dv=linux64_deb"
echo -e "\thttps://docs.docker.com/engine/install/ubuntu/"
echo -e "\t\tsudo groupadd docker; sudo usermod -aG docker $USER; newgrp docker"
