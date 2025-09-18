#!/bin/bash

# BlackSea Production Deployment Script
# This script handles the complete deployment process for BlackSea platform

set -e

# Configuration
APP_NAME="blacksea"
DOMAIN="blacksea.click"
APP_DIR="/var/www/$APP_NAME"
BACKUP_DIR="/var/backups/$APP_NAME"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Determine deployment user
if [[ $EUID -eq 0 ]]; then
    # Running as root, use a deployment user or current user
    DEPLOY_USER=${DEPLOY_USER:-www-data}
else
    DEPLOY_USER=${USER:-$(whoami)}
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}" >&2
}

warn() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

# Pre-deployment checks
pre_deployment_checks() {
    log "Running pre-deployment checks..."

    # Check if running as root - allow but warn
    if [[ $EUID -eq 0 ]]; then
        warn "Running as root - this is allowed but not recommended for security"
        warn "Consider creating a deployment user with sudo privileges"
        sleep 2
    fi

    # Check required commands
    local required_commands=("git" "ruby" "bundle" "npm" "nginx" "systemctl")
    for cmd in "${required_commands[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            error "Required command '$cmd' not found"
            exit 1
        fi
    done

    # Check environment variables
    if [[ -z "$RAILS_MASTER_KEY" ]]; then
        error "RAILS_MASTER_KEY environment variable is not set"
        exit 1
    fi

    log "Pre-deployment checks passed"
}

# Create backup
create_backup() {
    log "Creating backup..."

    sudo mkdir -p "$BACKUP_DIR"

    # Backup database
    if [[ -f ".env.production" ]]; then
        source .env.production
        if [[ -n "$DATABASE_URL" ]]; then
            log "Creating database backup..."
            # Add database backup logic here
        fi
    fi

    # Backup application files
    if [[ -d "$APP_DIR" ]]; then
        sudo tar -czf "$BACKUP_DIR/app_$TIMESTAMP.tar.gz" -C /var/www "$APP_NAME"
        log "Application backup created: $BACKUP_DIR/app_$TIMESTAMP.tar.gz"
    fi
}

# Deploy application
deploy_app() {
    log "Deploying application..."

    # Create application directory
    sudo mkdir -p "$APP_DIR"
    sudo chown -R $DEPLOY_USER:$DEPLOY_USER "$APP_DIR"

    # Copy application files
    log "Copying application files..."
    rsync -av --exclude='.git' --exclude='node_modules' --exclude='tmp' ./ "$APP_DIR/"

    cd "$APP_DIR"

    # Install Ruby dependencies
    log "Installing Ruby dependencies..."
    bundle config set --local without 'development test'
    bundle install --deployment

    # Install Node.js dependencies
    log "Installing Node.js dependencies..."
    npm ci --production

    # Setup environment
    log "Setting up environment..."
    cp .env.production.example .env.production
    # Note: You need to manually configure .env.production with real values

    # Precompile assets
    log "Precompiling assets..."
    RAILS_ENV=production bundle exec rake assets:precompile

    # Run database migrations
    log "Running database migrations..."
    RAILS_ENV=production bundle exec rake db:migrate

    # Create systemd service files
    create_systemd_services

    log "Application deployed successfully"
}

# Create systemd services
create_systemd_services() {
    log "Creating systemd services..."

    # Puma service
    sudo tee /etc/systemd/system/${APP_NAME}-puma.service > /dev/null <<EOF
[Unit]
Description=BlackSea Puma Server
After=network.target

[Service]
Type=simple
User=$DEPLOY_USER
WorkingDirectory=$APP_DIR
Environment=RAILS_ENV=production
Environment=PORT=3000
ExecStart=/usr/local/bin/bundle exec puma -C config/puma.rb
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

    # Sidekiq service
    sudo tee /etc/systemd/system/${APP_NAME}-sidekiq.service > /dev/null <<EOF
[Unit]
Description=BlackSea Sidekiq
After=network.target redis-server.service

[Service]
Type=simple
User=$DEPLOY_USER
WorkingDirectory=$APP_DIR
Environment=RAILS_ENV=production
ExecStart=/usr/local/bin/bundle exec sidekiq
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

    sudo systemctl daemon-reload
}

# Configure nginx
configure_nginx() {
    log "Configuring nginx..."

    # Copy nginx configuration
    sudo cp config/nginx.production.conf /etc/nginx/sites-available/$APP_NAME

    # Enable site
    sudo ln -sf /etc/nginx/sites-available/$APP_NAME /etc/nginx/sites-enabled/

    # Remove default nginx site
    sudo rm -f /etc/nginx/sites-enabled/default

    # Test nginx configuration
    sudo nginx -t

    log "Nginx configured successfully"
}

# Start services
start_services() {
    log "Starting services..."

    # Reload nginx
    sudo systemctl reload nginx

    # Start application services
    sudo systemctl enable ${APP_NAME}-puma
    sudo systemctl enable ${APP_NAME}-sidekiq

    sudo systemctl start ${APP_NAME}-puma
    sudo systemctl start ${APP_NAME}-sidekiq

    # Wait for services to start
    sleep 10

    # Check service status
    sudo systemctl status ${APP_NAME}-puma --no-pager -l
    sudo systemctl status ${APP_NAME}-sidekiq --no-pager -l

    log "Services started successfully"
}

# Health check
health_check() {
    log "Running health checks..."

    # Check if application is responding
    local max_attempts=30
    local attempt=1

    while [[ $attempt -le $max_attempts ]]; do
        if curl -f -s "http://localhost:3000/health" > /dev/null; then
            log "Application health check passed"
            return 0
        fi

        log "Waiting for application to respond (attempt $attempt/$max_attempts)..."
        sleep 5
        ((attempt++))
    done

    error "Application health check failed"
    return 1
}

# Post-deployment tasks
post_deployment() {
    log "Running post-deployment tasks..."

    # Clean up old backups (keep last 10)
    if [[ -d "$BACKUP_DIR" ]]; then
        cd "$BACKUP_DIR"
        ls -t *.tar.gz 2>/dev/null | tail -n +11 | xargs -r rm -f
    fi

    # Log deployment completion
    log "Deployment completed successfully!"
    log "Application URL: https://$DOMAIN"
    log "Admin panel: https://$DOMAIN/admin"
}

# Rollback function
rollback() {
    error "Deployment failed, starting rollback..."

    # Stop services
    sudo systemctl stop ${APP_NAME}-puma || true
    sudo systemctl stop ${APP_NAME}-sidekiq || true

    # Restore from backup if available
    if [[ -f "$BACKUP_DIR/app_$TIMESTAMP.tar.gz" ]]; then
        log "Restoring from backup..."
        cd /var/www
        sudo rm -rf "$APP_NAME"
        sudo tar -xzf "$BACKUP_DIR/app_$TIMESTAMP.tar.gz"
        sudo chown -R $DEPLOY_USER:$DEPLOY_USER "$APP_NAME"
    fi

    # Restart services
    sudo systemctl start ${APP_NAME}-puma || true
    sudo systemctl start ${APP_NAME}-sidekiq || true

    error "Rollback completed"
    exit 1
}

# Main deployment function
main() {
    log "Starting BlackSea deployment..."

    # Set up error handling
    trap rollback ERR

    pre_deployment_checks
    create_backup
    deploy_app
    configure_nginx
    start_services

    if health_check; then
        post_deployment
    else
        error "Health check failed"
        rollback
    fi
}

# Run main function
main "$@"