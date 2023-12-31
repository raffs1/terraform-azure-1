terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    random = {
      version = "3.1.0"      
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "rg" {
  count    = length(var.resource_group_names)
  name     = var.resource_group_names[count.index]
  location = var.location
}



resource "azurerm_resource_group" "azurermNetworkWatcher" {
  name     = "NetworkWatcherRG"
  location = "Australia East"
}

resource "azurerm_network_watcher" "azurermNetworkWatcher" {
  name                = "NetworkWatcherRG"
  location            = azurerm_resource_group.azurermNetworkWatcher.location
  resource_group_name = azurerm_resource_group.azurermNetworkWatcher.name
}

resource "azurerm_network_interface" "nic" {
  count = var.vm_count

  name                = "${var.vm_prefix}-nic-${count.index}"
  location            = azurerm_resource_group.rg[count.index].location
  resource_group_name = azurerm_resource_group.rg[count.index].name

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id = azurerm_subnet.azsubnet[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = element(azurerm_public_ip.publicip.*.id,count.index)
  }
}

resource "azurerm_subnet" "azsubnet" {
  count = var.vm_count
  name                 = "default"
  resource_group_name = azurerm_resource_group.rg[count.index].name
  virtual_network_name = azurerm_virtual_network.vnet[count.index].name
  address_prefixes = [element(var.address_space, 3)]
}

resource "azurerm_public_ip" "publicip" {
  count = var.vm_count
  name      =    "publicip${count.index}"
  resource_group_name = azurerm_resource_group.rg[count.index].name
  location = var.location
  allocation_method = "Static"
}



resource "azurerm_virtual_network" "vnet" {
  count               = length(var.resource_group_names)
  name                = "az-vnet"
  address_space = [element(var.address_space,3)]
  location = var.location
  resource_group_name = azurerm_resource_group.rg[count.index].name
}

resource "azurerm_linux_virtual_machine" "vm" {
  count = var.vm_count

  name                = "${var.vm_prefix}${count.index}"
  resource_group_name = azurerm_resource_group.rg[count.index].name
  location            = azurerm_resource_group.rg[count.index].location
  size                = "Standard_DS1_v2"
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  admin_username      = var.admin_user
  admin_password = random_password.linux_vm_password.result
  disable_password_authentication = false

  admin_ssh_key {
    username   = var.admin_user
    public_key = var.admin_ssh_key
  }

  os_disk {
    name = "myosdisk${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = merge(var.tag1,var.tag2)


}

resource "random_password" "linux_vm_password" {
  length = 8
  special = true
}


# #### create azure storage account
# resource "azurerm_storage_account" "azstorage" {
#  name                     = var.storageaccount
#  resource_group_name      = azurerm_resource_group.rg.name
#  #resource_group_name      = azurerm_resource_group.rg[count.index]
#  # resource_group_name = var.storageaccountrg.name
#  location                 = var.location 
#  account_tier             = "Standard"
#  account_replication_type = "LRS"
#  tags = var.tags
#}

#resource "azurerm_storage_container" "azstoragecontainer" {
#  count = var.vm_count
#  name  = "${var.containername}${count.index}"
#
#  storage_account_name  = azurerm_storage_account.azstorage.name
#  container_access_type = "private"
#}


