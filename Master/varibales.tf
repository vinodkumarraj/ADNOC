variable "env_prefix" {
    type = string
    default = "Dev"
    description = "Deployment for environment for the resources"
}

variable "project_prefix" {
    type = string
    default = "PoC"
    description = "Project code to be used for the resources"
}

variable "cost_prefix" {
    type = string
    default = "CoE"
    description = "Cost center to be used for the resources"
}

variable "location" {
    type = string
    default = "East US"
    description = "Location name to be used for the resources"
}

variable "vnet_address_space" {
    type = list
    default = ["10.0.0.0/16"]
    description = "Address Spaces to be used for the Virtual Network"
}

variable "subnet_prefix" {
    type = string
    default = "10.0.0.0/24"
    description = "Subnet Prefix within the Virtual Network"
}

variable "LA_Sku" {
    type        = string
    description = "Prefix to be used for the resources"
}

variable "LA_retention_in_days" {
    type = string
    description = "Retention days"
}