resource "azurerm_subscription" "landing_zone" {
  for_each = var.subscriptions

  subscription_id = each.value.subscription_id
  display_name    = each.value.display_name

  tags = var.tags
}

resource "azurerm_role_assignment" "landing_zone_roles" {
  for_each = var.role_assignments

  scope              = each.value.scope
  role_definition_id = each.value.role_definition_id
  principal_id       = each.value.principal_id
}