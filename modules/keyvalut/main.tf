# provider "azurerm" {
#   features {
#     key_vault {
#       purge_soft_delete_on_destroy    = true
#       recover_soft_deleted_key_vaults = true
#     }
#   }
# }

resource "azurerm_key_vault" "key" {
  for_each = var.keyvaults

  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name = each.value.sku_name

  dynamic "access_policy" {
    for_each = each.value.access_policies
    content {
      tenant_id = lookup(access_policy.value, "tenant_id", data.azurerm_client_config.current.tenant_id)
      object_id = lookup(access_policy.value, "object_id", data.azurerm_client_config.current.object_id)

      key_permissions    = lookup(access_policy.value, "key_permissions", [])
      secret_permissions = lookup(access_policy.value, "secret_permissions", [])
      storage_permissions = lookup(access_policy.value, "storage_permissions", [])
    }
  }
}