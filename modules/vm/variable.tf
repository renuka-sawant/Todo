variable "vms" {
  description = "Configuration for virtual machine(s)"
  type = map(object({
    vm_name                = string
    network_interface_name = string
    location               = string
    resource_group_name    = string
    vm_size                = string
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    storage_os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })
    admin_username                = string
    admin_password                = string
    disable_password_authentication = bool
    tags                         = map(string)
    delete_os_disk_on_termination = bool
    delete_data_disks_on_termination = bool
  }))
}
variable "nics" {
  description = "Configuration for network interface(s)"
  type = map(object({
    network_interface_name = string
    location               = string
    resource_group_name    = string

    ip_configuration = map(object({
      name                          = string
      subnet_id                     = optional(string)
      vnet                          = optional(string)
      subnet                        = optional(string)
      private_ip_address_allocation = string
    }))
  }))
}

variable "subnet_ids" {
  description = "Map of subnet ids passed from network module: { vnet => { subnet => id } }"
  type        = map(map(string))
  default     = {}
}

variable "vmpip" {
  description = "Optional map of public IP configurations to create and attach to NICs/VMs"
  type = map(object({
    public_ip_name      = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = map(string)
  }))
  default = {}
}

 