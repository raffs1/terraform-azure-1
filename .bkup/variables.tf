

variable "vm_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 2  # Change this to the desired number of VMs
}

variable "vm_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "azure-linux-vm-"
}

#variable "resource_group_name" {
#  description = "Name of the Azure resource group"
#  # type        = list(string)
#  type = string
#  default     = "az-rg-001"
#  # default = ["devrg","prodrg"]
#}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "Australia East"  # Change this to your desired Azure region
}

variable "admin_user" {
  description = "Username for SSH access"
  type        = string
  default     = "adminuser"
}

variable "address_space" {
    description = "list of subnet ip address ranges"
    type = list(string)
}

variable "tag1" {
  description = "Tag1 added to linux VM creation"
}
variable "tag2" {
  description = "Tag2 added to linux VM creation"
}

variable "storageaccount"{
  description = "storage account"
}

variable "storageaccountrg" {
  description = "storage account resource group"
  #default = "devrg"
}
variable "tags" {
  type = map
}

variable "containername" {
  description = "storage container name"
  type = string
}

variable "resource_group_names" {
  type = list(string)
  # default =  see terraform.tfvars file  
}
