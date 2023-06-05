#!/bin/sh

# Update Ubuntu
apt-get update
apt-get upgrade -y

# Install curl, wget, git, and Java
apt-get install -y curl wget git openjdk-11-jdk

# Download Node.js, install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
apt-get install -y nodejs

# Configure Java path
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Download Chrome and install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb


# Install necessary libraries for project execution
apt-get install -y xvfb libgtk-3-0 libgbm1

# Add this line at the end of the file /etc/apt/sources.list, install Allure and Allure commandline
echo "deb http://ppa.launchpad.net/qameta/allure/ubuntu trusty main" | tee -a /etc/apt/sources.list
apt-get update
apt-get install -y allure
npm install -g allure-commandline

# Fix potential broken dependencies
apt-get -f install -y

# Install Cypress
npm install cypress

# Install project dependencies
npm install
