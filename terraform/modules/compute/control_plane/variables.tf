variable "compartment_ocid" { type = string }  
variable "availability_domain" { type = string }  
variable "instance_shape" {  
  type = string  
  description = "OCI compute instance shape"  
  validation {  
    condition     = can(regex("^VM.Standard.A1.Flex$", var.instance_shape))  
    error_message = "Only VM.Standard.A1.Flex is supported"  
  }  
}  
variable "memory_in_gbs" {  
  type = number  
  description = "Memory allocation in GBs"  
  validation {  
    condition     = var.memory_in_gbs >= 6 && var.memory_in_gbs <= 24  
    error_message = "Memory must be between 6 and 24 GB"  
  }  
}  
variable "ocpus" { type = number }  
variable "subnet_id" { type = string }  
variable "ssh_public_key" { type = string }  
variable "docker_compose_url" { type = string }  
variable "image_ocid" { type = string }  
variable "project_name" { type = string }  
variable "additional_tags" { type = map(string) }  
variable "cloudflare_tunnel_url" { type = string }  
variable "cloudflare_tunnel_token" {  
  type = string  
  description = "Cloudflare Tunnel token"  
  sensitive = true  
}  
variable "coolify_secret" {  
  type = string  
  description = "Coolify secret key"  
  sensitive = true  
}  
variable "coolify_db_password" {  
  type = string  
  description = "Coolify database password"  
  sensitive = true  
}  