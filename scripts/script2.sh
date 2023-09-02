#!/bin/bash

sudo apt update

sudo apt install apache2 -y

sudo ufw allow 'Apache'

sudo -i

sudo cat > /var/www/html/index.html <<'EOF'
<h1> Hello there!</h1>
  <p>
    Welcome to my Second Server:
    <a href="https://www.facebook.com"Connect with friends and family</a>
  </p>
EOF