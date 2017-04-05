
# remove the old file and add our one
sudo rm /etc/nginx/sites-available/default
sudo cp nginx.default /etc/nginx/sites-available/default

# finally, restart the nginx service so the new config takes hold
sudo service nginx restart

# install the node webhook handler and start the hook server
cd /home/ubuntu/app
npm install 
pm2 start app.js