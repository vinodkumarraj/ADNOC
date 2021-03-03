resource "azurerm_resource_group" "rg" {
    name     = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-RG"
    location = var.location
	
	tags = {
		Project = var.project_prefix
		Environment = var.env_prefix
	}
}