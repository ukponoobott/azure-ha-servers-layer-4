resource "azurerm_resource_group" "main" {
  name     = "rg-${var.workload}-${var.environment}-${var.location}"
  location = var.location
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                            = "kv-${var.workload}-${var.environment}-${var.location}-${var.instance_number}"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enable_rbac_authorization       = var.enable_rbac_authorization
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  sku_name                        = var.sku_name
}

resource "azurerm_role_assignment" "this" {
  for_each             = var.enable_rbac_authorization ? toset(["role"]) : toset([])
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.principal_id == "" ? data.azurerm_client_config.current.object_id : var.principal_id
}

resource "random_string" "username" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "azurerm_key_vault_secret" "username" {
  name         = "admin_username"
  value        = random_string.username.result
  key_vault_id = azurerm_key_vault.this.id
  depends_on   = [azurerm_role_assignment.this]
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "password" {
  name         = "admin_password"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.this.id
  depends_on   = [azurerm_role_assignment.this]
}


resource "azurerm_network_interface_backend_address_pool_association" "main" {
  count                   = 2
  network_interface_id    = element(azurerm_network_interface.main.*.id, count.index)
  ip_configuration_name   = "ipconfig-${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
}