#!/bin/bash

#update machine
sudo apt update && sudo apt upgrade -y

#install apache and dependencies

sudo apt install apache2 wget unzip git -y

#start and enable apache2

sudo service apache2 start
sudo service apache2 enable
sudo service apache2 status

#create webfiles to rose directory
sudo mkdir -p /rose
cd /rose
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
unzip 2135_mini_finance.zip
cd 2135_mini_finance
sudo cp -r * /var/www/html


# Configure Git
git config --global user.name "ObikeMartins"
git config --global user.email "chiemezieobike@gmail.com"

# Clone Git repository
cd ~
git clone https://github.com/ObikeMartins/project-hazel.git
cd project-hazel

# Initialize Git repository if not already initialized
if [ ! -d ".git" ]; then
    sudo git init
    sudo git remote add origin https://github.com/ObikeMartins/project-hazel.git
fi

# Copy files to repository (if needed)
# For example, if you want to include the web files in a specific directory within the repo
 cp -r /rose/2135_mini_finance /home/mezikko/project-hazel/

# Stage changes
git add .

# Commit changes
git commit -m "Added new files from /rose/2135_mini_finance"

# Push changes
git push origin master
