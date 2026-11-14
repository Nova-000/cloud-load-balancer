# Start with a lightweight Linux image that already has Node.js installed
FROM node:18-slim

# Install Nginx and gettext-base (which provides the envsubst command)
RUN apt-get update && apt-get install -y nginx gettext-base

# Create a working directory inside the container
WORKDIR /usr/src/app

# Copy your server folder, loadbalancer folder, and start.sh into the container
COPY . .

# Grant Linux permission to execute the startup script
RUN chmod +x start.sh

# Tell Docker to run the script when Render boots the container
CMD ["./start.sh"]
