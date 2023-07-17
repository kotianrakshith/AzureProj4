resource "azurerm_log_analytics_workspace" "aks_log_analytics" {
  name                =  "raksloganalytics"
  location            =  "westeurope"
  resource_group_name = azurerm_resource_group.vmss.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
