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
  }  
}  

provider "oci" {  
  tenancy_ocid     = var.tenancy_ocid  
  user_ocid        = var.user_ocid  
  fingerprint      = var.api_fingerprint  
  private_key_path = var.api_private_key_path  
  region           = var.region  
}  