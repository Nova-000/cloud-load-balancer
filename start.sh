#!/bin/bash

# 1. Install backend dependencies
cd server
npm install

# 2. Boot the 3 Node.js workers with distinct names in the background
SERVER_NAME="Server 1" PORT=3001 node index.js &
SERVER_NAME="Server 2" PORT=3002 node index.js &
SERVER_NAME="Server 3" PORT=3003 node index.js &

# Return to the root directory
cd ..

# 3. Nuke the default factory Nginx pages to prevent the "Welcome to nginx!" error
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default
rm -f /etc/nginx/conf.d/default.conf

# 4. Inject Render's dynamic port into the Nginx configuration
# Make sure your folder is named exactly "load_balancer"
envsubst '${PORT}' < load_balancer/nginx.conf > /etc/nginx/nginx.conf

# 5. Start Nginx in the foreground to keep the container alive
nginx -g 'daemon off;'
