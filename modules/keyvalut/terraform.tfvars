keyvaults = {
  kv_vm1 = {
    name                       = "kv-frontendvm"
    resource_group_name        = "rg-fore1"
    location                   =  "East US"
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    access_policies = [
      {
        object_id = "3e5ae24a-4217-4a76-9bbc-16e7cede7db0"
        tenant_id = "81a12d0b-0093-495d-869a-835d58dc9fad"
        key_permissions    = ["Get", "List"]
        secret_permissions = ["Get", "List"]
        storage_permissions = ["Get"]
      }
    ]
  }

  kv_vm2 = {
    name                       = "kv-backendvm"
    resource_group_name        = "rg-fore2"
    location                   =  "East US"
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    access_policies = [
      {
        object_id = "3e5ae24a-4217-4a76-9bbc-16e7cede7db0"
        tenant_id = "81a12d0b-0093-495d-869a-835d58dc9fad"
        key_permissions    = ["Get", "List"]
        secret_permissions = ["Get", "List"]
      }
    ]
  }
}
 