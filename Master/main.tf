module "rg_module" {
    source              = "../AzureRM.ResourceGroup"
    env_prefix          = var.env_prefix
    project_prefix      = var.project_prefix
    cost_prefix         = var.cost_prefix
    location            = var.location
}

module "vnet_module" {
    source              = "../AzureRM.VNET"
    env_prefix          = var.env_prefix
    project_prefix      = var.project_prefix
    cost_prefix         = var.cost_prefix
    location            = var.location
    vnet_resourcegroup  = module.rg_module.rg_name
    vnet_address_space  = var.vnet_address_space
    subnet_prefix       = var.subnet_prefix
}

module "vm_module" {
    source              = "../AzureRM.VM"
    env_prefix 			= var.env_prefix
    project_prefix 		= var.project_prefix
    cost_prefix 		= var.cost_prefix
    location 			= var.location
    vm_resourcegroup 	= module.rg_module.rg_name
    subnet_id 			= module.vnet_module.subnet_id
}

module "backup_module" {
    source              = "../AzureRM.BACKUP"
    env_prefix 			= var.env_prefix
    project_prefix 		= var.project_prefix
    cost_prefix 		= var.cost_prefix
    location 			= var.location
    rsv_resourcegroup 	= module.rg_module.rg_name
    vm_ids 				= [module.vm_module.VM_id]
}

module "mgmt_module" {
    source 				= "../AzureRM.MGMT"
    env_prefix 			= var.env_prefix
    project_prefix 		= var.project_prefix
    cost_prefix 		= var.cost_prefix
    location 			= var.location
    LA_resourcegroup 	= module.rg_module.rg_name
    LA_retention_in_days = var.LA_retention_in_days
    LA_Sku 				= var.LA_Sku
}

