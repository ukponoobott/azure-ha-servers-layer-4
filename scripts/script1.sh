#!/bin/bash

sudo apt update

sudo apt install apache2 -y

sudo ufw allow 'Apache'

sudo -i

sudo cat > /var/www/html/index.html <<'EOF'
<h1> Hello there!</h1>
  <p>
    Welcome to my First Server:
    <a href="https://www.googe.com">Search everything with Google</a>
  </p>
EOF