
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-VNet"
  resource_group_name = var.vnet_resourcegroup
  location            = var.location
  address_space       = var.vnet_address_space

  tags = {
		Project = var.project_prefix
		Environment = var.env_prefix
	}
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-Subnet"
  resource_group_name  = var.vnet_resourcegroup
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = var.subnet_prefix
}