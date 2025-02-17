resource "oci_core_virtual_network" "gw_vcn" {  
  cidr_block      = var.vcn_cidr_block  
  display_name    = var.vcn_display_name  
  dns_label       = var.vcn_dns_label  
  compartment_id  = var.compartment_ocid  
}  

resource "oci_core_security_list" "gw_seclist" {  
  compartment_id = var.compartment_ocid  
  vcn_id         = oci_core_virtual_network.gw_vcn.id  

  ingress_security_rules {  
    protocol    = "6" # TCP  
    source      = var.allowed_cidrs  
    tcp_options {  
      min = 443  
      max = 443  
    }  
    description = "HTTPS access"  
  }  

  ingress_security_rules {  
    protocol    = "6" # TCP  
    source      = var.admin_cidr  
    tcp_options {  
      min = 22  
      max = 22  
    }  
    description = "SSH access"  
  }  

  egress_security_rules {  
    protocol   = "17" # UDP  
    destination = "0.0.0.0/0"  
    udp_options {  
      min = 7844  
      max = 7844  
    }  
    description = "Cloudflare Tunnel"  
  }  
}  

resource "oci_core_internet_gateway" "gw_igw" {  
  compartment_id = var.compartment_ocid  
  vcn_id         = oci_core_virtual_network.gw_vcn.id  
  display_name   = var.igw_display_name  
}  

resource "oci_core_subnet" "gw_subnet" {  
  compartment_id       = var.compartment_ocid  
  vcn_id               = oci_core_virtual_network.gw_vcn.id  
  cidr_block           = var.services_subnet_cidr  
  display_name         = var.subnet_display_name  
  availability_domain  = var.availability_domain  
  security_list_ids    = [oci_core_security_list.gw_seclist.id]  
  dns_label            = var.subnet_dns_label  
  route_table_id       = oci_core_route_table.gw_rt.id  
}  

resource "oci_core_route_table" "gw_rt" {  
  compartment_id = var.compartment_ocid  
  vcn_id         = oci_core_virtual_network.gw_vcn.id  

  route_rules {  
    destination       = "0.0.0.0/0"  
    network_entity_id = oci_core_internet_gateway.gw_igw.id  
  }  
}  