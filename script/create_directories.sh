#!/bin/bash

# Create necessary directories for BlackSea deployment

APP_DIR="/var/www/blacksea"
DEPLOY_USER="www-data"

echo "Creating necessary directories..."

# Create application directory structure
sudo mkdir -p $APP_DIR
sudo mkdir -p $APP_DIR/tmp/pids
sudo mkdir -p $APP_DIR/tmp/sockets
sudo mkdir -p $APP_DIR/log
sudo mkdir -p $APP_DIR/shared/log
sudo mkdir -p $APP_DIR/shared/tmp/pids
sudo mkdir -p $APP_DIR/shared/tmp/sockets

# Set proper ownership
sudo chown -R $DEPLOY_USER:$DEPLOY_USER $APP_DIR

# Set proper permissions
sudo chmod -R 755 $APP_DIR
sudo chmod -R 775 $APP_DIR/tmp
sudo chmod -R 775 $APP_DIR/log

echo "Directories created successfully!"
echo "Application directory: $APP_DIR"
echo "Owner: $DEPLOY_USER"