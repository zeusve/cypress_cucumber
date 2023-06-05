#!/bin/sh

# Update Ubuntu
apt-get update
apt-get upgrade -y

# Update and Install git
apt update -y && apt install -y git

# Install curl, wget, git, and Java
apt-get install -y curl wget git openjdk-11-jdk

# Configure Java path
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Download Chrome and install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# Clone repository
git clone https://github.com/zeusve/cypress_cucumber.git 

# Change to the project directory
cd cypress_cucumber

# Changue permissions of the script.sh
chmod +x script.sh

# Install necessary libraries for project execution
apt-get install -y xvfb libgtk-3-0 libgbm1

# Fix potential broken dependencies
apt-get -f install -y

# Download Node.js, install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_20.x | bash 
apt-get install -y nodejs

# Install project dependencies
npm install

# Install Cypress
npm install cypress

# Add this line at the end of the file /etc/apt/sources.list, install Allure and Allure commandline
echo "deb http://ppa.launchpad.net/qameta/allure/ubuntu trusty main" | tee -a /etc/apt/sources.list
apt-get update
apt-get install -y allure
npm install -g allure-commandline
