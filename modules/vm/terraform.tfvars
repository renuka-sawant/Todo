# vms = {
#   vm1 = {
#     vm_name                = "frontendvm"
#     network_interface_name = "frontend-nic"
#     location               = "SouthIndia"
#     resource_group_name    = "rg-fore1"
#     vm_size                = "Standard_B2s"
#     storage_image_reference = {
#       publisher = "Canonical"
#       offer     = "0001-com-ubuntu-server-jammy"
#       sku       = "22_04-lts"
#       version   = "latest"
#     }
#     storage_os_disk = {
#       name              = "frontend-os-disk"
#       caching           = "ReadWrite"
#       create_option     = "FromImage"
#       managed_disk_type = "Standard_LRS"
#     }
#     admin_username = "azureuser"
#     admin_password = "prem@1234!"   # Replace with secure secrets for production
#     disable_password_authentication = false
#     tags = {
#       environment = "staging"
#       role        = "frontend"
#     }
#     delete_os_disk_on_termination    = false
#     delete_data_disks_on_termination = false
#   }

#   vm2 = {
#     vm_name                = "backendvm"
#     network_interface_name = "backend-nic"
#     location               = "SouthIndia"
#     resource_group_name    = "rg-fore2"
#     vm_size                = "Standard_B2s"
#     storage_image_reference = {
#       publisher = "Canonical"
#       offer     = "0001-com-ubuntu-server-jammy"
#       sku       = "22_04-lts"
#       version   = "latest"
#     }
#     storage_os_disk = {
#       name              = "backend-os-disk"
#       caching           = "ReadWrite"
#       create_option     = "FromImage"
#       managed_disk_type = "Standard_LRS"
#     }
#     admin_username = "azureuser"
#     admin_password = "prem@1234!"   # Replace with secure secrets for production
#     disable_password_authentication = false
#     tags = {
#       environment = "staging"
#       role        = "backend"
#     }
#     delete_os_disk_on_termination    = false
#     delete_data_disks_on_termination = false
#   }
# }

# nics = {
#   vm1 = {
#     network_interface_name = "frontend-nic"
#     location               = "SouthIndia"
#     resource_group_name    = "rg-fore1"
#     ip_configuration = {
#       ip1 = {
#         name                          = "ipconfig1"
#         vnet                          = "vnet1"
#         subnet                        = "sub1"
#         private_ip_address_allocation = "Dynamic"
#       }
#     }
#   }
#   vm2 = {
#     network_interface_name = "backend-nic"
#     location               = "SouthIndia"
#     resource_group_name    = "rg-fore2"
#     ip_configuration = {
#       ip1 = {
#         name                          = "ipconfig1"
#         vnet                          = "vnet1"
#         subnet                        = "sub2"
#         private_ip_address_allocation = "Dynamic"
#       }
#     }
#   }
# }
