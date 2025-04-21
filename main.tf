terraform {
  backend "azurerm" {
    resource_group_name  = "<RESOURCE_GROUP_NAME>"
    storage_account_name = "<STORAGE_ACCOUNT_NAME>"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "management" {
  source = "./modules/management"
  # Add variables for management module
}

module "connectivity" {
  source = "./modules/connectivity"
  # Add variables for connectivity module
}

module "landing_zones" {
  source = "./modules/landing_zones"
  # Add variables for landing zones module
}