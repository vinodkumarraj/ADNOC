output "rsv_id" {
  value = azurerm_recovery_services_vault.vault.id
}

output "rsv_name" {
  value = azurerm_recovery_services_vault.vault.name
}

output "rsv_policy_Id" {
  value = azurerm_backup_policy_vm.vmpolicy.id
}