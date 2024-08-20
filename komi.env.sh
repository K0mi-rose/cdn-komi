#!/bin/bash

if [ -f "/etc/arch-release" ]; then
    pmInstall='pacman -S'
    pmRemove='pacman -Rns'
    pmUpdate='pacman -Syy'
    pmUpgrade='pacman -Syu'
else 
    pmInstall='apt-get install -y'
    pmRemove='apt-get remove'
    pmUpdate='apt update'
    pmUpgrade='apt upgrade'
fi

sudo $pmUpdate && sudo $pmUpgrade

#System
sudo $pmInstall wget curl
sudo $pmInstall nginx
sudo $pmInstall git

#Fullstack node env
sudo $pmInstall npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

#Puppeteer dependencies
sudo $pmInstall libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev
sudo $pmInstall libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxi-dev libxtst-dev libnss3 libcups2 libxss1 libxrandr2 libasound2 libatk1.0-0 libatk-bridge2.0-0 libpangocairo-1.0-0 libgtk-3-0 libgbm1 

#Python
sudo $pmInstall python3

#C
sudo $pmInstall gcc
sudo $pmInstall make
sudo $pmInstall build-essential

#Ricing
sudo $pmInstall neofetch
sudo $pmInstall w3m
sudo $pmInstall w3m-img
sudo $pmInstall imagemagick
sudo $pmInstall xdotool

sudo $pmInstall kitty

#Install .BASHRC
curl -o- https://raw.githubusercontent.com/K0mi-rose/cdn-komi/main/.bashrc > ~/.bashrc
mkdir ~/scripts && cd ~/scripts \
&& wget https://raw.githubusercontent.com/K0mi-rose/cdn-komi/main/scripts/cpuTemperatureWatch \
&& wget https://raw.githubusercontent.com/K0mi-rose/cdn-komi/main/scripts/processPowerUsage

source ~/.bashrc

echo "Don't forget to install your IDE and to source..."