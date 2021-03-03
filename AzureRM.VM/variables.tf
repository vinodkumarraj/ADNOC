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

variable "vm_resourcegroup" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "location" {
    type        = string
    description = "Prefix to be used for the resources" 
}

variable "subnet_id" {
    type = string
    description = "Subnet to be used for the VM"
}
