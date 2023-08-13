resource "azurerm_container_app" "main" {
  name                         = var.app_name
  container_app_environment_id = data.terraform_remote_state.core.outputs.container_app_environment_id
  resource_group_name          = data.terraform_remote_state.core.outputs.resource_group_name
  revision_mode                = "Single"

    template {
        container {
            name   = "${var.app_name}-container"
            image  = "nginx:latest"
            cpu    = 0.25
            memory = "0.5Gi"
        }
        max_replicas = 5
    }

    ingress {
        allow_insecure_connections = false
        external_enabled           = true
        target_port                = var.app_port
        traffic_weight {
            percentage = 100
            latest_revision = true
        }
    }
}
