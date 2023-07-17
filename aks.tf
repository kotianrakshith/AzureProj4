resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "rakscluster123"
  location            = "westus"
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "aksrakshith-cluster"

  default_node_pool {
    name       = "default"
    node_count = "1"
    vm_size    = "standard_d2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
  addon_profile {
    azure_policy {enabled =  true}
    oms_agent {
      enabled =  true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_log_analytics.id
    }
  }
}
