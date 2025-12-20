variable "networks" {
  description = "Configuration for virtual network(s)"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
      security_group   = optional(string)
    }))
    tags = map(string)
  }))
}