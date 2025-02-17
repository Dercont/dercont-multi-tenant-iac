provider_name = "oci"  
  
# Networking  
vcn_cidr_block = "10.0.0.0/16"  
services_subnet_cidr = "10.0.2.0/24"  
control_plane_subnet_cidr = "10.0.1.0/24"  
vcn_display_name = "myproject-vcn"  
subnet_display_name = "myproject-subnet"  
vcn_dns_label = "myproject-vcn"  
subnet_dns_label = "myproject-subnet"  
compartment_ocid = "ocid1.tenancy.oc1..<ID>"  
availability_domain = "Sohw:EU-MADRID-1-AD-1"  
igw_display_name = "myproject-igw"  
allowed_cidrs = ["192.168.0.0/16"]  
admin_cidr = "192.168.0.0/16" # Updated from 0.0.0.0/0  

# Control Plane  
control_plane_memory_in_gbs = 8  
control_plane_ocpus = 2  
control_plane_boot_volume_size_in_gbs = 80  
control_plane_display_name = "myproject-control-plane"  
instance_shape = "VM.Standard.A1.Flex"  
project_name = "myproject"  
owner_email = "admin@example.com"  
cost_center = "engineering"  

# Services  
services_memory_in_gbs = 16  
services_ocpus = 2  
services_boot_volume_size_in_gbs = 120  
services_display_name = "myproject-services"  

# Common  
ssh_public_key = "~/.ssh/id_rsa.pub"  
docker_compose_url = "https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-$(uname -s)-$(uname -m)"  
cloudflare_tunnel_url = "https://install.cloudflareclient.com/cloudflared-linux"  
cloudflare_tunnel_token = "your-cloudflare-tunnel-token"  
image_ocid = "ocid1.image.oc1.eu-madrid-1.aaaaaaaaulwlk5q2rincuyvfryhkj5iznptvn4m3w7axcn7brnegrp46s4za"  
tenancy_ocid = "ocid1.tenancy.oc1..<ID>"  
user_ocid = "ocid1.user.oc1..<ID>"  
api_fingerprint = "xx:xx:xx:xx:xx:xx"  
api_private_key_path = "~/.oci/oci_api_key.pem"  
region = "eu-madrid-1"  