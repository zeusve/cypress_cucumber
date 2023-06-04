#!/bin/sh

cd home
apt-get update
apt-get install -y curl wget git openjdk-11-jdk
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt install nodejs -y
git clone https://github.com/zeusve/cypress_cucumber.git
cd cypress_cucumber
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt -f install -y
apt install npm -y
npm install
npm install cypress
apt-get update
apt install xvfb -y && apt install libgtk-3-0 -y && apt install libgbm1 -y && apt-add-repository ppa:qameta/allure
apt-get update
echo "deb http://ppa.launchpad.net/qameta/allure/ubuntu trusty main" | tee -a /etc/apt/sources.list
apt install allure -y
npm install -g allure-commandline