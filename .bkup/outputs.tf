
#output "public_ip" {
#    value = azurerm_public_ip.*.azurerm_public_ip
#
#}

output "generated_password" {
    value = random_password.linux_vm_password.result
    sensitive = true
}

output "azurerm_linux_virtual_machine" {
  value = azurerm_linux_virtual_machine.vm.*.name
}

#output "storage"{
#    value = azurerm_storage_account.azstorage.name
#}
#
#output "container" {
#    value = azurerm_storage_container.azstoragecontainer[*].name
#}

output "azurerm_resource_group" {
    value = azurerm_resource_group.rg.*.name
}