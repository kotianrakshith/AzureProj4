resource "azurerm_lb" "vmss" {
 name                = "practice-lb"
 location            = "westeurope"
 resource_group_name = azurerm_resource_group.vmss.name

 frontend_ip_configuration {
   name                 = "PublicIPAddress"
   public_ip_address_id = azurerm_public_ip.vmss.id
 }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
 loadbalancer_id     = azurerm_lb.vmss.id
 name                = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "vmss" {
 resource_group_name = azurerm_resource_group.vmss.name
 loadbalancer_id     = azurerm_lb.vmss.id
 name                = "ssh-running-probe"
 port                = 80
}

resource "azurerm_lb_rule" "lbnatrule" {
   resource_group_name            = azurerm_resource_group.vmss.name
   loadbalancer_id                = azurerm_lb.vmss.id
   name                           = "http"
   protocol                       = "Tcp"
   frontend_port                  = 80
   backend_port                   = 80
   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpepool.id]
   frontend_ip_configuration_name = "PublicIPAddress"
   probe_id                       = azurerm_lb_probe.vmss.id
}
