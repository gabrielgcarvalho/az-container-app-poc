data "terraform_remote_state" "core" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "gctfstatesa"
    container_name       = "tfstate"
    key                  = "apps-poc/core/terraform.tfstate"
  }
}
