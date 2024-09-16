sudo apt-get -y update

# Download Nodejs

sudo apt install nodejs -y
sudo apt install npm -y


# Download Database

sudo apt install mysql-server -y

sudo systemctl start mysql
sudo systemctl enable mysql


# npm install

## run commands for front
# npm run build
# or
# sudo npm install -g yarn
# yarn build


# Download web server

sudo apt-get install -y nginx
sudo rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default


echo 'server {
    listen 80;
    server_name example.com;

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

sudo nginx -t
sudo service nginx restart
