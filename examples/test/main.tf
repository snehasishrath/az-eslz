module "management" {
  source = "../../modules/management"
  root_management_group_name = "test-root"
  root_management_group_display_name = "Test Root"
  child_management_groups = {
    test-platform = {
      name = "test-platform"
      display_name = "Test Platform"
    }
  }
  policy_assignments = {
    test-policy = {
      name = "test-policy"
      policy_definition_id = "<POLICY_DEFINITION_ID>"
      scope = "/providers/Microsoft.Management/managementGroups/test-root"
    }
  }
}

module "connectivity" {
  source = "../../modules/connectivity"
  hub_vnet_name = "test-hub-vnet"
  hub_address_space = ["10.1.0.0/16"]
  hub_subnet_name = "test-hub-subnet"
  hub_subnet_prefixes = ["10.1.1.0/24"]
  firewall_name = "test-firewall"
  firewall_private_ip = "10.1.1.4"
}

module "landing_zones" {
  source = "../../modules/landing_zones"
  subscriptions = {
    test-subscription = {
      subscription_id = "<TEST_SUBSCRIPTION_ID>"
      display_name = "Test Subscription"
    }
  }
  role_assignments = {
    test-role = {
      scope = "/subscriptions/<TEST_SUBSCRIPTION_ID>"
      role_definition_id = "<ROLE_DEFINITION_ID>"
      principal_id = "<PRINCIPAL_ID>"
    }
  }
}