variable "env_prefix" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "project_prefix" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "cost_prefix" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "rsv_resourcegroup" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "location" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "vm_ids" {
    type = list
    description = "List of VMs to be added to Backup vault"
}