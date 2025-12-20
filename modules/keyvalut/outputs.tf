output "key_vault_ids" {
  description = "Map of key vault IDs keyed by the key in var.keyvaults"
  value = { for k, v in azurerm_key_vault.key : k => v.id }
}

output "key_vault_names" {
  description = "Map of key vault names keyed by the key in var.keyvaults"
  value = { for k, v in azurerm_key_vault.key : k => v.name }
}
