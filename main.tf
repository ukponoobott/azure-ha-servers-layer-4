resource "azurerm_resource_group" "main" {
  name     = "LoadBalancerRG"
  location = "eastus2"
}

resource "azurerm_availability_set" "main" {
  name                = "example-aset"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_network_interface_backend_address_pool_association" "main" {
  network_interface_id    = azurerm_network_interface.primary.id
  ip_configuration_name   = "ipconfig1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
}

resource "azurerm_network_interface_backend_address_pool_association" "main2" {
  network_interface_id    = azurerm_network_interface.secondary.id
  ip_configuration_name   = "ipconfig2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
}


# resource "null_resource" "sc" {

#  provisioner "local-exec" {

#     command = "/bin/bash scripts/script1.sh"
#   }

#   depends_on = [
#     azurerm_linux_virtual_machine.primary
#   ]
# }

# resource "null_resource" "sc2" {

#  provisioner "local-exec" {

#     command = "/bin/bash scripts/script2.sh"
#   }

#   depends_on = [
#     azurerm_linux_virtual_machine.secondary
#   ]
# }