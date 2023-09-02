resource "azurerm_network_interface" "main" {
  count               = 2
  name                = "nic-${var.workload}-${var.environment}-${var.location}-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  count                           = 2
  name                            = "vm-${var.workload}-${var.environment}-${var.location}-${count.index}"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_B1ms"
  admin_username                  = azurerm_key_vault_secret.username.value
  admin_password                  = azurerm_key_vault_secret.password.value
  zone                            = count.index
  disable_password_authentication = false

  user_data = filebase64("${path.module}/scripts/script${count.index}.sh")

  network_interface_ids = [
    element(azurerm_network_interface.main.*.id, count.index),
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "jumpbox" {
  name                = "nic-${var.workload}-${var.environment}-${var.location}-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jumpbox.id
  }
}

resource "azurerm_linux_virtual_machine" "jumpbox" {
  name                            = "vm-${var.workload}-${var.environment}-${var.location}-${count.index}"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_B1s"
  admin_username                  = azurerm_key_vault_secret.username.value
  admin_password                  = azurerm_key_vault_secret.password.value
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.jumpbox.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}