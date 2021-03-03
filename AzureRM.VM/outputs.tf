output "VM_name" {
    value = azurerm_windows_virtual_machine.VM.name
}

output "nic_name" {
    value = azurerm_network_interface.nic.name
}

output "VM_id" {
    value = azurerm_windows_virtual_machine.VM.id
}

output "nic_id" {
    value = azurerm_network_interface.nic.id
}