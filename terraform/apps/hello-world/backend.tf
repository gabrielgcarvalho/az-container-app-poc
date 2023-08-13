terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "gctfstatesa"
    container_name       = "tfstate"
    key                  = "apps-poc/apps/hello-world/terraform.tfstate"
  }
}