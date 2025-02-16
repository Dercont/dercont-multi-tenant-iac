output "instance_id" {
  description = "OCID of the control plane instance"
  value       = oci_core_instance.control_plane.id
}

output "public_ip" {
  description = "Public IP of the control plane instance"
  value       = oci_core_instance.control_plane.public_ip
}