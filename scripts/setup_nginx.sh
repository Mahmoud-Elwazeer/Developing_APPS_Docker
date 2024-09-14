sudo apt-get -y update
sudo apt-get install -y nginx
sudo rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default


echo 'server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://127.0.0.1:5000;
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
