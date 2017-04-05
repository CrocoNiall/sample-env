sudo apt-get update -y
sudo apt-get install nginx -y

# update the registry of node sources
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install node
sudo apt-get install nodejs -y

# install git and npm
sudo apt-get install git -y

# install pm
sudo npm install pm2 -g
