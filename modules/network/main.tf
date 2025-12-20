resource "azurerm_virtual_network" "vnet" {
  for_each            = var.networks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  tags                = each.value.tags
}

// Create subnets as separate azurerm_subnet resources so we can export their IDs
// for other modules to consume and create implicit dependencies.
locals {
  subnets = merge([
    for vnet_key, v in var.networks : {
      for sub_key, sb in v.subnets : "${vnet_key}.${sub_key}" => {
        vnet_key            = vnet_key
        sub_key             = sub_key
        name                = sb.name
        address_prefixes    = sb.address_prefixes
        resource_group_name = v.resource_group_name
        location            = v.location
      }
    }
  ]...)
}

resource "azurerm_subnet" "subnet" {
  for_each = local.subnets

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
}