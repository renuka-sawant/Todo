resource "azurerm_storage_account" "mystorage" {
    for_each = var.mystorage
  name                     = each.value.name
  resource_group_name      =each.value.resource_group_name
  location                 =each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = {
    environment = "staging"
  }
}