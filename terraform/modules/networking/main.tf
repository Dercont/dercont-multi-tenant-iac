resource "oci_core_virtual_network" "gw-vcn" {
  cidr_block      = var.vcn_cidr_block
  display_name    = var.vcn_display_name
  dns_label       = var.vcn_dns_label
  compartment_id  = var.compartment_ocid
}

resource "oci_core_internet_gateway" "gw-igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.gw-vcn.id
  display_name   = var.igw_display_name
}

resource "oci_core_subnet" "gw-subnet" {
  compartment_id       = var.compartment_ocid
  vcn_id               = oci_core_virtual_network.gw-vcn.id
  cidr_block           = var.subnet_cidr_block
  display_name         = var.subnet_display_name
  availability_domain  = var.availability_domain
  security_list_ids    = [oci_core_virtual_network.gw-vcn.default_security_list_id]
  dns_label            = var.subnet_dns_label
  route_table_id       = oci_core_route_table.gw-rt.id
}

resource "oci_core_route_table" "gw-rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.gw-vcn.id

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.gw-igw.id
  }
}