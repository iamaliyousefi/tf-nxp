resource "azurerm_virtual_network" "vnet" {
  name                = var.VNET
  location            = "Sweden Central"
  resource_group_name = var.RESOURCE_GROUP
  address_space       = ["10.0.0.0/16"]
#  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.VNET_SUBNET
    address_prefixes = ["10.0.1.0/24"]
  }
}
