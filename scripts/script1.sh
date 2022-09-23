#!/bin/bash

sudo apt update

sudo apt install apache2 -y

sudo ufw allow 'Apache'

sudo -i

sudo cat > /var/www/html/index.html <<'EOF'  
<h1> Hello User</h1>
  <p>
    Welcome to Knixat server 1:
    <a href="https://www.knixat.com">Checkout our website</a>
  </p>
EOF