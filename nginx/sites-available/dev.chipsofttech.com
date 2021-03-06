server {
    listen 80;

    server_name dev-hands.chipsofttech.com;

    location / {
        proxy_pass http://10.132.244.93:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}


server {
  listen 80 default_server; 
  return 404;
}
