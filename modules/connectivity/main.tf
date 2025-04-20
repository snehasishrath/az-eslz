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