resource "azurerm_recovery_services_vault" "vault" {
  name                = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-RSVault"
  location            = var.location
  resource_group_name = var.rsv_resourcegroup
  sku                 = "Standard"

  soft_delete_enabled = true
}

resource "azurerm_backup_policy_vm" "vmpolicy" {
  name                = "${var.project_prefix}-${var.env_prefix}-${var.cost_prefix}-RSVault-Policy"
  resource_group_name = var.rsv_resourcegroup
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }

  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}

resource "azurerm_backup_protected_vm" "vm1" {
  count = "${length(var.vm_ids)}"
  resource_group_name = var.rsv_resourcegroup
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  source_vm_id        = "${var.vm_ids[count.index]}"
  backup_policy_id    = azurerm_backup_policy_vm.vmpolicy.id

  tags = {
		Project = var.project_prefix
		Environment = var.env_prefix
	}
}