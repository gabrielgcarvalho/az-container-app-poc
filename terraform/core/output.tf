output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.main.workspace_id
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.main.id
}

output "resource_group_name" {
  value = azurerm_resource_group.main.name
}