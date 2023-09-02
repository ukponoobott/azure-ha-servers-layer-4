# azure-loadbalancer-snat
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.20.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.password](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.username](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/key_vault_secret) | resource |
| [azurerm_lb.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_outbound_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_outbound_rule) | resource |
| [azurerm_lb_probe.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine.jumpbox](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.jumpbox](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_backend_address_pool_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_security_group.jumpbox](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.jumpbox](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.outbound](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/role_assignment) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet) | resource |
| [azurerm_subnet.mgmt](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.jumbox](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/virtual_network) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.username](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/data-sources/client_config) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_LbIP"></a> [LbIP](#output\_LbIP) | n/a |
<!-- END_TF_DOCS -->