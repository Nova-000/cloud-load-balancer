FROM node:18-slim

# Install Nginx and gettext-base (for the envsubst command)
RUN apt-get update && apt-get install -y nginx gettext-base

# Create a working directory inside the container
WORKDIR /usr/src/app

# Copy all folders (server, load_balancer) and files into the container
COPY . .

# Grant Linux permission to execute the startup script
RUN chmod +x start.sh

# Run the script when Render boots the container
CMD ["./start.sh"]
