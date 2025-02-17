variable "vcn_cidr_block" { type = string }  
variable "services_subnet_cidr" {  
  type = string  
  description = "CIDR block for services subnet"  
  default = "10.0.2.0/24"  
}  
variable "control_plane_subnet_cidr" {  
  type = string  
  description = "CIDR block for control plane subnet"  
  default = "10.0.1.0/24"  
}  
variable "subnet_display_name" { type = string }  
variable "vcn_dns_label" { type = string }  
variable "subnet_dns_label" { type = string }  
variable "compartment_ocid" { type = string }  
variable "availability_domain" { type = string }  
variable "igw_display_name" { type = string }  
variable "allowed_cidrs" { type = list(string) }  
variable "admin_cidr" { type = string }  