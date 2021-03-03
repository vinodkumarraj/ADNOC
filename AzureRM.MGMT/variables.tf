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

variable "location" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "LA_Sku" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "LA_retention_in_days" {
    type = number
    description = "Retention days"
}

variable "LA_resourcegroup" {
    type        = string
    description = "Log Analytics resource group to be used"
}