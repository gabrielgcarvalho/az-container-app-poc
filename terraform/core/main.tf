
resource "azurerm_resource_group" "main" {
  name     = "apps-poc"
  location = "canadacentral"
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "apps-poc"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "main" {
  name                       = "apps-poc"
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id
}
