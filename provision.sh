#!/bin/bash
# Updates and Upgrades the system
sudo apt-get update -y
sudo apt-get upgrade -y

#Installs Nginx, Nodejs and python properties
sudo apt-get install nginx -y
sudo apt-get install nodejs -y
sudo apt-get install python-software-properties -y

#Finds a specific verison of Nodejs and installs it again and with pm2
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g

#Creates a environment variable and stores in .bashrc file
sudo echo 'export DB_HOST="mongodb://192.168.10.150:27017/posts"' >> .bashrc
source ~/.bashrc

#Removes nginx default file and replaces with own default file from home dir
sudo rm -rf /etc/nginx/sites-available/default
sudo ln -s /home/ubuntu/bootcamp-jenkinscicd/default /etc/nginx/sites-available/

#Restarts Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx

# Node seeds app for database
#node app/app/seeds/seed.js
#cd /home/vagrant/app/app

#Intsalls npm and dependencies and does another node seed
#sudo npm install
#sudo npm install express
#node seeds/seed.js

#I have 2 node seeds because I am unsure which on works and which doesn't.
