resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.hub_address_space

  tags = var.tags
}

resource "azurerm_subnet" "hub_subnet" {
  name                 = var.hub_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = var.hub_subnet_prefixes

  tags = var.tags
}

resource "azurerm_firewall" "hub_firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.hub_subnet.id
    private_ip_address   = var.firewall_private_ip
  }

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "connectivity_logs" {
  name                = "connectivity-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  retention_in_days = 30

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "connectivity_diagnostics" {
  name               = "connectivity-diagnostics"
  target_resource_id = azurerm_virtual_network.hub.id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.connectivity_logs.id

  log {
    category = "NetworkSecurityGroupEvent"
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

resource "azurerm_consumption_budget_subscription" "connectivity_budget" {
  name                = "connectivity-budget"
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