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
  - curl -L "${cloudflare_tunnel_url}" -o /usr/local/bin/cloudflared
  - chmod +x /usr/local/bin/cloudflared
  - mkdir -p /etc/cloudflared
  - echo "${cloudflare_tunnel_token}" > /etc/cloudflared/tunnel-token
  - cloudflared tunnel run --token /etc/cloudflared/tunnel-token