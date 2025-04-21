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

resource "azurerm_log_analytics_workspace" "landing_zone_logs" {
  name                = "landing-zone-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  retention_in_days = 30

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "landing_zone_diagnostics" {
  name               = "landing-zone-diagnostics"
  target_resource_id = azurerm_subscription.landing_zone.id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.landing_zone_logs.id

  log {
    category = "Administrative"
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

resource "azurerm_consumption_budget_subscription" "landing_zone_budget" {
  name                = "landing-zone-budget"
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