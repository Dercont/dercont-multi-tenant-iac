resource "oci_core_instance" "services" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  shape               = var.instance_shape

  create_vnic_details {
    subnet_id = oci_core_subnet.gw-subnet.id
  }

  shape_config {
    memory_in_gbs = var.memory_in_gbs
    ocpus         = var.ocpus
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
    user_data = base64encode(templatefile("${path.module}/user_data.tpl", {
      cloudflare_tunnel_url = var.cloudflare_tunnel_url
      cloudflare_tunnel_token = var.cloudflare_tunnel_token
    }))
  }

  source_details {
    source_type = "image"
    source_id   = var.image_ocid
  }

  display_name = var.display_name
  boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
}