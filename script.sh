#!/bin/sh

# Update ubuntu
apt-get update

# Install curl, web get, git and java
apt-get install -y curl wget git openjdk-11-jdk

# Download nodejs, install nodejs and node package manager
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt install nodejs -y
apt install npm -y

# Config Java path
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64ls 

# Download chrome and install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# Change directory to 'app'
cd app

# Install necessary libraries for project execution
apt install xvfb -y && apt install libgtk-3-0 -y && apt install libgbm1 -y 

# Add tthis line at the end of the file /etc/apt/sources.list, install allure and allure comandline
echo "deb http://ppa.launchpad.net/qameta/allure/ubuntu trusty main" | tee -a /etc/apt/sources.list
apt install allure -y
npm install -g allure-commandline

# Install cypress
npm install cypress

# Install project dependencies
npm install 

# Fix potential broken dependencies
apt -f install -y