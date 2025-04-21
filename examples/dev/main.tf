module "management" {
  source = "../../modules/management"
  root_management_group_name = "dev-root"
  root_management_group_display_name = "Development Root"
  child_management_groups = {
    dev-platform = {
      name = "dev-platform"
      display_name = "Development Platform"
    }
  }
  policy_assignments = {
    dev-policy = {
      name = "dev-policy"
      policy_definition_id = "<POLICY_DEFINITION_ID>"
      scope = "/providers/Microsoft.Management/managementGroups/dev-root"
    }
  }
}

module "connectivity" {
  source = "../../modules/connectivity"
  hub_vnet_name = "dev-hub-vnet"
  hub_address_space = ["10.0.0.0/16"]
  hub_subnet_name = "dev-hub-subnet"
  hub_subnet_prefixes = ["10.0.1.0/24"]
  firewall_name = "dev-firewall"
  firewall_private_ip = "10.0.1.4"
}

module "landing_zones" {
  source = "../../modules/landing_zones"
  subscriptions = {
    dev-subscription = {
      subscription_id = "<DEV_SUBSCRIPTION_ID>"
      display_name = "Development Subscription"
    }
  }
  role_assignments = {
    dev-role = {
      scope = "/subscriptions/<DEV_SUBSCRIPTION_ID>"
      role_definition_id = "<ROLE_DEFINITION_ID>"
      principal_id = "<PRINCIPAL_ID>"
    }
  }
}