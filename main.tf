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