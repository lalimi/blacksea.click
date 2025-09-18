#!/bin/bash

# BlackSea Application Update Script
# This script updates an existing BlackSea deployment without full redeployment

set -e

# Configuration
APP_NAME="blacksea"
DOMAIN="blacksea.click"
APP_DIR="/var/www/$APP_NAME"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

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

# Check if application directory exists
check_app_exists() {
    if [[ ! -d "$APP_DIR" ]]; then
        error "Application directory $APP_DIR does not exist"
        error "Please run full deployment first: ./script/deploy.sh"
        exit 1
    fi

    if [[ ! -f "$APP_DIR/config/application.rb" ]]; then
        error "Application does not appear to be properly deployed in $APP_DIR"
        exit 1
    fi

    log "Application found in $APP_DIR"
}

# Update application code
update_code() {
    log "Updating application code..."

    cd "$APP_DIR"

    # Stash any local changes (like environment files)
    git stash push -m "pre-update-$TIMESTAMP" --include-untracked 2>/dev/null || true

    # Pull latest changes
    git pull origin main

    # Restore stashed changes
    if git stash list | grep -q "pre-update-$TIMESTAMP"; then
        git stash pop
        log "Restored local changes"
    fi

    log "Code updated successfully"
}

# Update Ruby dependencies
update_ruby_deps() {
    log "Updating Ruby dependencies..."

    cd "$APP_DIR"

    # Update bundle
    bundle config set --local without 'development test'
    bundle install --deployment

    log "Ruby dependencies updated"
}

# Update Node.js dependencies
update_node_deps() {
    log "Updating Node.js dependencies..."

    cd "$APP_DIR"

    # Update npm packages
    npm ci --production

    log "Node.js dependencies updated"
}

# Run database migrations
run_migrations() {
    log "Running database migrations..."

    cd "$APP_DIR"

    # Check if there are pending migrations
    if bundle exec rake db:migrate:status | grep -q "down"; then
        log "Found pending migrations, running them..."
        RAILS_ENV=production bundle exec rake db:migrate
        log "Migrations completed"
    else
        log "No pending migrations found"
    fi
}

# Precompile assets
precompile_assets() {
    log "Precompiling assets..."

    cd "$APP_DIR"

    # Remove old assets
    rm -rf public/assets/*
    rm -rf public/packs/*

    # Precompile new assets
    RAILS_ENV=production bundle exec rake assets:precompile

    log "Assets precompiled"
}

# Restart services
restart_services() {
    log "Restarting services..."

    # Restart Puma (zero-downtime restart if possible)
    if sudo systemctl is-active --quiet ${APP_NAME}-puma; then
        log "Restarting Puma server..."
        sudo systemctl restart ${APP_NAME}-puma
    else
        warn "Puma service is not running, starting it..."
        sudo systemctl start ${APP_NAME}-puma
    fi

    # Restart Sidekiq
    if sudo systemctl is-active --quiet ${APP_NAME}-sidekiq; then
        log "Restarting Sidekiq..."
        sudo systemctl restart ${APP_NAME}-sidekiq
    else
        warn "Sidekiq service is not running, starting it..."
        sudo systemctl start ${APP_NAME}-sidekiq
    fi

    # Reload Nginx
    sudo systemctl reload nginx

    log "Services restarted"
}

# Health check
health_check() {
    log "Running health checks..."

    # Wait for services to start
    sleep 5

    # Check Puma
    if sudo systemctl is-active --quiet ${APP_NAME}-puma; then
        log "✓ Puma service is running"
    else
        error "✗ Puma service failed to start"
        return 1
    fi

    # Check Sidekiq
    if sudo systemctl is-active --quiet ${APP_NAME}-sidekiq; then
        log "✓ Sidekiq service is running"
    else
        error "✗ Sidekiq service failed to start"
        return 1
    fi

    # Check application health endpoint
    local max_attempts=10
    local attempt=1

    while [[ $attempt -le $max_attempts ]]; do
        if curl -f -s "http://localhost:3000/health" > /dev/null 2>&1; then
            log "✓ Application health check passed"
            return 0
        fi

        log "Waiting for application to respond (attempt $attempt/$max_attempts)..."
        sleep 3
        ((attempt++))
    done

    error "✗ Application health check failed"
    return 1
}

# Rollback function
rollback() {
    error "Update failed, attempting rollback..."

    cd "$APP_DIR"

    # Try to rollback to previous commit
    if git log --oneline -n 5 | grep -q "update\|deploy"; then
        log "Rolling back to previous commit..."
        git reset --hard HEAD~1
        restart_services
        log "Rollback completed"
    else
        error "Cannot determine safe rollback point"
    fi

    exit 1
}

# Main update function
main() {
    log "Starting BlackSea application update..."

    # Set up error handling
    trap rollback ERR

    check_app_exists
    update_code
    update_ruby_deps
    update_node_deps
    run_migrations
    precompile_assets
    restart_services

    if health_check; then
        log "🎉 Update completed successfully!"
        log "Application URL: https://$DOMAIN"
        log "Admin panel: https://$DOMAIN/admin"
    else
        error "Health check failed after update"
        rollback
    fi
}

# Show usage if requested
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "BlackSea Application Update Script"
    echo ""
    echo "This script updates an existing BlackSea deployment with the latest code"
    echo "without performing a full redeployment."
    echo ""
    echo "Usage:"
    echo "  sudo ./script/update.sh"
    echo ""
    echo "Requirements:"
    echo "  - Application must be already deployed in $APP_DIR"
    echo "  - Git repository must be properly configured"
    echo "  - All required environment variables must be set"
    echo ""
    exit 0
fi

# Run main function
main "$@"