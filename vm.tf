resource "azurerm_public_ip" "practice" {
 name                         = "practice-vm-public-ip"
 location                     = "westeurope"
 resource_group_name          = azurerm_resource_group.vmss.name
 allocation_method            = "Static"
 domain_name_label            = "${random_string.fqdn.result}-ssh"
}

resource "azurerm_network_interface" "practice" {
 name                = "practice-nic"
 location            = "westeurope"
 resource_group_name = azurerm_resource_group.vmss.name

 ip_configuration {
   name                          = "IPConfiguration"
   subnet_id                     = azurerm_subnet.vmss.id
   private_ip_address_allocation = "dynamic"
   public_ip_address_id          = azurerm_public_ip.practice.id
 }

}

resource "azurerm_linux_virtual_machine" "practice" {
 name                  = "practice"
 location              = "westeurope"
 resource_group_name   = azurerm_resource_group.vmss.name
 network_interface_ids = [azurerm_network_interface.practice.id]
 size               = "Standard_DS1_v2"

 source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
}
 os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
 }

 computer_name                   = "practicevm"
 admin_username                  = "rakshith"
 admin_password                  = "temporary@54321"
 disable_password_authentication = false
 
}
