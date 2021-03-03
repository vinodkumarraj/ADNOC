resource "azurerm_network_interface" "nic" {
  name                = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-NIC"
  resource_group_name = var.vm_resourcegroup
  location            = var.location


  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM" {
  name                = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-VM"
  resource_group_name = var.vm_resourcegroup
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = {
		Project = var.project_prefix
		Environment = var.env_prefix
	}
}