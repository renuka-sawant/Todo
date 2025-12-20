variable "rgvar" {
  description = "Map of resource groups to create"
  type        = map(any)
  default     = {}
}

variable "networks" {
  description = "Map of virtual networks"
  type        = map(any)
  default     = {}
}

variable "mystorage" {
  description = "Map of storage accounts"
  type        = map(any)
  default     = {}
}

variable "vmpip" {
  description = "Map of public IP definitions (optional)"
  type        = map(any)
  default     = {}
}

variable "keyvaults" {
  description = "Map of key vaults"
  type        = map(any)
  default     = {}
}

variable "vms" {
  description = "Map of VM definitions"
  type        = map(any)
  default     = {}
}

variable "nics" {
  description = "Map of NIC definitions"
  type        = map(any)
  default     = {}
}

variable "subscription_id" {
  description = "Azure subscription id used by the provider"
  type        = string
  default     = ""
}
