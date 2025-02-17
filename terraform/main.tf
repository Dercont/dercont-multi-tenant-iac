terraform {  
  required_providers {  
    oci = {  
      source = "oracle/oci"  
      version = "~> 5.30.0"  
    }  
  }  

  backend "s3" {  
    bucket                 = "myproject-terraform-state"  
    key                    = "oci-infra/terraform.tfstate"  
    region                 = "eu-central-1"  
    encrypt                = true  
    dynamodb_table         = "myproject-terraform-lock"  
    workspace_key_prefix   = "oci-infra/"  
  }  
}  

module "provider" {  
  source  = "./providers/${var.provider_name}"  
}  

module "networking" {  
  source  = "./modules/networking"  
  provider = provider.oci  
}  

module "control_plane" {  
  source  = "./modules/compute/control_plane"  
  provider = provider.oci  
}  

module "services" {  
  source  = "./modules/compute/services"  
  provider = provider.oci  
}  