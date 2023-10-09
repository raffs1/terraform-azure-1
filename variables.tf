

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

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  # type        = list(string)
  type = string
  default     = "az-rg-001"
  # default = ["devrg","prodrg"]
}

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

variable "admin_ssh_key" {
  description = "SSH public key for VM access"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClqyrrOtR4olHb/J/NBUKaeVlyxREsTCvtVlH/PqQDCZ933LpzXLZS5Xf03KookQJR6oceoNQaCN03QHJomYtsVzF3dYbRQJnKF4Igwy4NcIxPukHSbr8Tx1pQyp1vkQUPlm6l4REdICU2PHStQVD70B+BbkMEV0ZPed9vjdcutqCK/MW4dXtUFUNGr5Cy4M/0win95NmmXy5wzfuAQHedtOAjZQk17XdClddl0TG/sMzDjHRiVpEMqNPIejSyZhv+DRUrvdLEpt2gTaSpVYd37nUkTupkt/jDDdUEaN0gDaXM2khqIJ9lyNg+zsi4SlYny6C9/byDTNlQs+CXmFXefA8NKBq5JNRuUJfEFpv1La4Sap6zOY/D3bmaZefha3XkE9iUjsj0Tug1wdWI3C51WfuRKvNGPRTPIFqtGMcVa0qRpasDCDQhH7BmOr0Skg+CVQVpJuExEABOt3Ai9KDUgRrimdxKLh+jr393P13/oa1RUon+0HwLWCkLBONXYeTfFVRFg3kAfjJP5akQoIMHIsjtMUDUM0ltI14G/h9nIedBC9mIF8Z3i54JQTFFfuyBm9Vh61myZoR48g9DO0xDRPCCDXYWLrOMdt6CaFI1pbtTybcbD8o0PLupHbrhONjejfe4e+LRpVyDEn4Kifri9cCJDAGP8UxaUDoIN2/3Ow== ajrafferty67@gmail.com"
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
  default = "devrg"
}
variable "tags" {
  type = map
}

variable "containername" {
  description = "storage container name"
  type = string
}