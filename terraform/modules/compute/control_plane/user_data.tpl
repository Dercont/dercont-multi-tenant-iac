#!/bin/bash  
set -euo pipefail  

# Setup logging  
exec 1> >(logger -s -t $(basename $0)) 2>&1  

# Install Docker  
if ! curl -fsSL https://get.docker.com | sh; then  
  echo "Failed to install Docker" >&2  
  exit 1  
fi  

if ! systemctl start docker; then  
  echo "Failed to start Docker" >&2  
  exit 1  
fi  

if ! systemctl enable docker; then  
  echo "Failed to enable Docker" >&2  
  exit 1  
fi  

# Install Docker Compose  
if ! curl -L "${docker_compose_url}" -o /usr/local/bin/docker-compose; then  
  echo "Failed to download Docker Compose" >&2  
  exit 1  
fi  

if ! chmod +x /usr/local/bin/docker-compose; then  
  echo "Failed to set Docker Compose permissions" >&2  
  exit 1  
fi  

# Install Coolify  
if ! curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash; then  
  echo "Failed to install Coolify" >&2  
  exit 1  
fi  

# Configure Coolify  
if ! echo "${coolify_secret}" | coolify config set secret; then  
  echo "Failed to configure Coolify secret" >&2  
  exit 1  
fi  

if ! echo "${coolify_db_password}" | coolify config set db.password; then  
  echo "Failed to configure Coolify database password" >&2  
  exit 1  
fi  

# Start Coolify  
if ! coolify start; then  
  echo "Failed to start Coolify" >&2  
  exit 1  
fi  