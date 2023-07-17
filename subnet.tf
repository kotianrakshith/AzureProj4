resource "azurerm_subnet" "vmss" {
 name                 = "practice-subnet"
 resource_group_name  = azurerm_resource_group.vmss.name
 virtual_network_name = azurerm_virtual_network.vmss.name
 address_prefixes       = ["10.0.2.0/24"]
}
