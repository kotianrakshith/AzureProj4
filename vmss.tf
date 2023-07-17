resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
 name                = "practicevmscaleset"
 location            = "westeurope"
 resource_group_name = azurerm_resource_group.vmss.name
 sku                 = "Standard_DS1_v2"
 instances           = 2
 admin_username      = "rakshith"
 admin_password      = "temporary@54321"
 disable_password_authentication = false
 

 source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
}

 os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }


 network_interface {
   name    = "terraformnetworkprofile"
   primary = true

   ip_configuration {
     name                                   = "IPConfiguration"
     subnet_id                              = azurerm_subnet.vmss.id
     load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
     primary = true
   }
 }
}
