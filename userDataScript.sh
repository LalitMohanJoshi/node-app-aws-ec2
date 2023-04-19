#!/bin/bash

sudo yum update -y
sudo yum install ruby -y
sudo yum install wget
cd /home/ec2-user
wget https://aws-codedeploy-ap-south-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
sudo service codedeploy-agent status 

#clean meta data 

sudo amazon-linux-extras list | grep nginx
sudo amazon-linux-extras enable nginx1
sudo yum clean metadata

########################################  setup nginx ######################################## 


sudo yum -y install nginx
nginx -v #to ensure that nginx is installed
sudo systemctl start nginx 
cd /etc/nginx/default.d
 
#setup curl 
sudo yum install curl -y  
sudo nginx -t

#sudo vim nginx.conf 
sudo systemctl restart nginx
 

########################################  setup node server ######################################## 

export HOME="/root" 

# Install nvm in a specific directory
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# One of the main reasons to use source is to refresh the current shell environment by running the bashrc file. 
source ~/.bashrc  

# This loads nvm  
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "NVM_DIR =========  $NVM_DIR"
echo "XDG_CONFIG_HOME =========  $XDG_CONFIG_HOME" 
echo "HOME =========  $HOME" 

#Install LTS version
nvm install lts/*  
node -v
npm install pm2@latest -g