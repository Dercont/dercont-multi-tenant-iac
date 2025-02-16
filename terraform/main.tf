terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.30.0"
    }
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