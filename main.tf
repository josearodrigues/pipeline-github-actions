terraform {
  required_version = ">=1.8.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }

    /*     azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.107.0"
    }*/

  }

  backend "s3" {
    bucket = "my-tf-bucket-remotestate-americojar2014"
    key    = "pipeline-github/terraform.tfstate"
    region = "us-east-1"
  }

  /*   backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "saterraformremotestat"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  } */
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      managed-by = "terraform"
      Owner      = "americojar"
    }
  }
}

/* provider "azurerm" {
  features {}
}
 */
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-tf-bucket-remotestate-americojar2014"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

/* data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "saterraformremotestat"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
} */