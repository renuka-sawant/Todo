output "pip_ids" {
  description = "Map of public IP resource ids keyed by the same map keys used in var.vmpip"
  value = { for k, v in azurerm_public_ip.pip : k => v.id }
}
