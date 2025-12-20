output "subnet_ids" {
  description = "Map of vnet keys to subkey->subnet_id maps"
  value = {
    for vnet_key, v in var.networks : vnet_key => {
      for sub_key, sb in v.subnets : sub_key => azurerm_subnet.subnet["${vnet_key}.${sub_key}"].id
    }
  }
}

output "vnet_ids" {
  description = "Map of virtual network ids by vnet key"
  value = {
    for k, v in azurerm_virtual_network.vnet : k => v.id
  }
}
