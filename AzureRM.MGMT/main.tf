resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-LA"
  location            = var.location
  resource_group_name = var.LA_resourcegroup
  sku                 = var.LA_Sku
  retention_in_days   = var.LA_retention_in_days
}