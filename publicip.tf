resource "azurerm_public_ip" "vmss" {
 name                         = "practice-public-ip"
 location                     = "westeurope"
 resource_group_name          = azurerm_resource_group.vmss.name
 allocation_method            = "Static"
 domain_name_label            = random_string.fqdn.result
}
