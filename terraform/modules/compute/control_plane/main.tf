resource "random_password" "coolify_secret" {  
  length   = 32  
  special  = true  
}  

resource "random_password" "coolify_db_password" {  
  length   = 16  
  special  = true  
} 

resource "oci_core_instance" "control_plane" {  
  availability_domain = var.availability_domain  
  compartment_id      = var.compartment_ocid  
  shape               = var.instance_shape  

  create_vnic_details {  
    subnet_id = module.networking.control_plane_subnet_id  
  }  

  shape_config {  
    memory_in_gbs = var.memory_in_gbs  
    ocpus         = var.ocpus  
  }  

  metadata = {  
    ssh_authorized_keys = file(var.ssh_public_key)  
    user_data = base64encode(templatefile("${path.module}/user_data.tpl", {  
      docker_compose_url = var.docker_compose_url  
      cloudflare_tunnel_url = var.cloudflare_tunnel_url  
      cloudflare_tunnel_token = var.cloudflare_tunnel_token  
      coolify_secret = var.coolify_secret  
      coolify_db_password = var.coolify_db_password  
    }))  
  }  

  source_details {  
    source_type = "image"  
    source_id   = var.image_ocid  
  }  

  display_name = format("%s-%s-control-plane", var.project_name, terraform.workspace)  
  defined_tags = local.mandatory_tags  
  freeform_tags = var.additional_tags  
}  