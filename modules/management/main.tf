resource "azurerm_management_group" "root" {
  name = var.root_management_group_name
  display_name = var.root_management_group_display_name
}

resource "azurerm_management_group" "child" {
  for_each = var.child_management_groups

  name           = each.value.name
  display_name   = each.value.display_name
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_policy_assignment" "management_policies" {
  for_each = var.policy_assignments

  name                 = each.value.name
  policy_definition_id = each.value.policy_definition_id
  scope                = each.value.scope
}