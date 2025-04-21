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

resource "azurerm_log_analytics_workspace" "management_logs" {
  name                = "management-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  retention_in_days = 30

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "management_diagnostics" {
  name               = "management-diagnostics"
  target_resource_id = azurerm_management_group.root.id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.management_logs.id

  log {
    category = "Policy"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }
}

resource "azurerm_consumption_budget_subscription" "management_budget" {
  name                = "management-budget"
  subscription_id     = var.subscription_id
  amount              = var.budget_amount
  time_grain          = "Monthly"

  notification {
    enabled         = true
    operator        = "GreaterThan"
    threshold       = 90
    contact_emails  = var.budget_contact_emails
  }
}