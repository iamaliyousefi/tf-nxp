#refer to a subnet
data "azurerm_subnet" "test" {
  name                 = var.VNET_SUBNET
  virtual_network_name = var.VNET
  resource_group_name  = var.RESOURCE_GROUP
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = var.RESOURCE_GROUP

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${data.azurerm_subnet.test.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-machine"
  resource_group_name = var.RESOURCE_GROUP
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  disable_password_authentication = "false"
  admin_password = "Aa8Jidahch812044622ugeir"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]


 # admin_ssh_key {
 #   username   = "adminuser"
 #   public_key = file("id_rsa.pub")
 # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }
}
