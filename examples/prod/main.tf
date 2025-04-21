module "management" {
  source = "../../modules/management"
  root_management_group_name = "prod-root"
  root_management_group_display_name = "Production Root"
  child_management_groups = {
    prod-platform = {
      name = "prod-platform"
      display_name = "Production Platform"
    }
  }
  policy_assignments = {
    prod-policy = {
      name = "prod-policy"
      policy_definition_id = "<POLICY_DEFINITION_ID>"
      scope = "/providers/Microsoft.Management/managementGroups/prod-root"
    }
  }
}

module "connectivity" {
  source = "../../modules/connectivity"
  hub_vnet_name = "prod-hub-vnet"
  hub_address_space = ["10.2.0.0/16"]
  hub_subnet_name = "prod-hub-subnet"
  hub_subnet_prefixes = ["10.2.1.0/24"]
  firewall_name = "prod-firewall"
  firewall_private_ip = "10.2.1.4"
}

module "landing_zones" {
  source = "../../modules/landing_zones"
  subscriptions = {
    prod-subscription = {
      subscription_id = "<PROD_SUBSCRIPTION_ID>"
      display_name = "Production Subscription"
    }
  }
  role_assignments = {
    prod-role = {
      scope = "/subscriptions/<PROD_SUBSCRIPTION_ID>"
      role_definition_id = "<ROLE_DEFINITION_ID>"
      principal_id = "<PRINCIPAL_ID>"
    }
  }
}