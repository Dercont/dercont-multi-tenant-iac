output "vcn_id" {
  description = "OCID of the VCN"
  value       = oci_core_virtual_network.gw-vcn.id
}

output "subnet_id" {
  description = "OCID of the subnet"
  value       = oci_core_subnet.gw-subnet.id
}