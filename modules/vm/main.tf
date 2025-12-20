resource "azurerm_network_interface" "nic" {
  for_each            = var.nics
  name                = each.value.network_interface_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.name
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation

      subnet_id = lookup(
        lookup(var.subnet_ids, ip_configuration.value.vnet, {}),
        ip_configuration.value.subnet,
        null
      )

      public_ip_address_id = lookup(module.publicip.pip_ids, each.key, null)
    }
  }
}

// Instantiate public IP resources from the publicip module when vmpip has entries.
module "publicip" {
  source = "../publicip"
  vmpip  = var.vmpip
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = var.vms
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.vm_size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    name                 = each.value.storage_os_disk.name
    caching              = each.value.storage_os_disk.caching
    storage_account_type = each.value.storage_os_disk.managed_disk_type
  }

  source_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }

  tags = each.value.tags
}
