#cloud-config
package_update: true
package_upgrade: true
packages:
  - docker.io
  - curl
  - git

runcmd:
  - systemctl start docker
  - systemctl enable docker
  - curl -L "${docker_compose_url}" -o /usr/local/bin/docker-compose
  - chmod +x /usr/local/bin/docker-compose
  - curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash