#!/bin/bash
sudo apt-get -y update

# Download Nodejs

sudo apt install nodejs -y
# or
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts
sudo npm install -g n
sudo n stable

sudo apt install npm -y


# Download Database

sudo apt install mysql-server -y

sudo systemctl start mysql
sudo systemctl enable mysql

sudo npm install -g pm2
sudo npm install -g yarn
sudo npm install -g serve


# Download mongodb
sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update

sudo apt-get install -y mongodb-org

sudo systemctl daemon-reload
sudo systemctl start mongod




# npm install

## run commands for front
# npm run build
# or
# yarn build


# Download web server

sudo apt-get install -y nginx
sudo rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default


echo 'server {
    listen 80;
    server_name example.com;

    # location / {
    #     root /var/www/your-site;
    #     index index.html;
    #     try_files $uri /index.html;
    # }

    location / {
        proxy_pass http://127.0.0.1:3000;
        # proxy_http_version 1.1;
        # proxy_set_header Upgrade $http_upgrade;
        # proxy_set_header Connection "upgrade";
        # proxy_set_header Host $host;
        # proxy_set_header X-Real-IP $remote_addr;
        # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        # proxy_set_header X-Forwarded-Proto $scheme;
        # proxy_redirect off;
    }
}' | sudo tee /etc/nginx/conf.d/myapp.conf


# sudo mkdir -p /var/www/your-site
# sudo cp -r build/* /var/www/your-site

sudo nginx -t
sudo service nginx restart
