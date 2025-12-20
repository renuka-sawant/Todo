# Create a resource group
resource "azurerm_resource_group" "myrg" {
  for_each = var.rgvar
  name     = each.value.name
  tags     = each.value.tags
  location = each.value.location
}

# Create a virtual network within the resource group
# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   address_space       = ["10.0.0.0/16"]
# }