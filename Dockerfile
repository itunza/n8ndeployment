# Use a base image with ARM support
FROM node:14-buster

# Set the working directory
WORKDIR /usr/src/app

# Install build dependencies
# Python and build tools (make, g++) might be needed for building some npm packages
RUN apt-get update && apt-get install -y curl python3 make g++

# Install n8n globally
RUN npm install n8n -g

# Create a directory for n8n data
RUN mkdir /home/node/.n8n

# Set the ownership of the n8n data directory to the node user
RUN chown -R node:node /home/node/.n8n

# Switch to the node user
USER node

# Expose the n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]