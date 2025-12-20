variable "keyvaults" {
  description = "Map of Key Vault configurations. Keys should match vm/nics keys to attach KV to VM level if needed."
  type = map(object({
    name                        = string
    resource_group_name         = string
    location                    = string
    sku_name                    = string
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    access_policies = optional(list(object({
      object_id          = optional(string)
      tenant_id          = optional(string)
      key_permissions    = optional(list(string))
      secret_permissions = optional(list(string))
      storage_permissions = optional(list(string))
    })), [])
  }))
  default = {}
}

