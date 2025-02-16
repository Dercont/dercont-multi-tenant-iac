output "instance_id" {
  description = "OCID of the services instance"
  value       = oci_core_instance.services.id
}

output "public_ip" {
  description = "Public IP of the services instance"
  value       = oci_core_instance.services.public_ip
}