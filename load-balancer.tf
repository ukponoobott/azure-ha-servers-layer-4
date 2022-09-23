resource "azurerm_lb" "main" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku = "Standard"
  sku_tier = "Regional"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.main.id
    
  }

  frontend_ip_configuration {
    name = "outbound-pip"
    public_ip_address_id = azurerm_public_ip.outbound.id
    
  }
}

resource "azurerm_lb_backend_address_pool" "main" {
  loadbalancer_id = azurerm_lb.main.id
  name            = "BackEndAddressPool"
}


resource "azurerm_lb_probe" "main" {
  loadbalancer_id = azurerm_lb.main.id
  name            = "ssh-running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "main" {
  loadbalancer_id                = azurerm_lb.main.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.main.id]
  probe_id = azurerm_lb_probe.main.id
}

resource "azurerm_lb_outbound_rule" "main" {
  name                    = "OutboundRule"
  loadbalancer_id         = azurerm_lb.main.id
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
  

  frontend_ip_configuration {
    name = "outbound-pip"
  }
}

# resource "azurerm_lb_nat_rule" "main" {
#   resource_group_name            = azurerm_resource_group.main.name
#   loadbalancer_id                = azurerm_lb.main.id
#   name                           = "SSHAccess"
#   protocol                       = "Tcp"
#   frontend_port_start            = 80
#   frontend_port_end              = 80
#   backend_port                   = 80
#   backend_address_pool_id        = azurerm_lb_backend_address_pool.main.id
#   frontend_ip_configuration_name = "PublicIPAddress"
# }