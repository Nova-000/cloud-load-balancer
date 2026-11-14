# Return to the root directory
cd ..

# Nuke the default factory Nginx pages
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default
rm -f /etc/nginx/conf.d/default.conf

# Inject Render's dynamic port into the Nginx configuration
envsubst '${PORT}' < loadbalancer/nginx.conf > /etc/nginx/nginx.conf

# Start Nginx in the foreground
nginx -g 'daemon off;'
