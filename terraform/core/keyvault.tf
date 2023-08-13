
resource "azurerm_key_vault" "main" {
  name                        = "apps-poc-keyvault"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Set",
      "Get"
    ]
  }
}

resource "azurerm_key_vault_secret" "docker_password" {
  name         = "docker-io-pass"
  value        = var.docker_password
  key_vault_id = azurerm_key_vault.main.id
}
