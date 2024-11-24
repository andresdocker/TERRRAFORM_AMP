#|°°°°°°°°°°°°°°°°°°°°limitamod la version del proveedor°°°°°°°°°°°°°°°°°
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.40.0, !=5.43.0 , >=5.44.0"
    }
  }
  required_version = "~>1.7.5"
}

#|regiones AWS - VPCs
provider "aws" {
    region = "us-east-1"  
}
provider "aws" {
    region =  "us-east-2"
    alias = "ohio"
  
}
provider "aws" {
    region = "us-east-1a"
    alias = "test1"  
}
provider "aws" {
    region =  "us-east-1b"
    alias = "test2"
  
}