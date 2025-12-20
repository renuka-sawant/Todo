# ------------------------ #
# RESOURCE GROUP
# ------------------------ #
rgvar = {
  demo = {
    name     = "demo-rg"
    location = "centralindia"
    tags     = { env = "dev" }
  }
}

# ------------------------ #
# NETWORK
# ------------------------ #
networks = {
  prod-vnet = {
    name                = "prod-vnet"
    location            = "centralindia"
    resource_group_name = "demo-rg"
    tags                = { env = "prod" }

    address_space = ["10.0.0.0/16"]

    subnets = {
      web-subnet = {
        name             = "web-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      app-subnet = {
        name             = "app-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

# ------------------------ #
# PUBLIC IP (only frontend)
# ------------------------ #
vmpip = {
  frontendvm = {
    public_ip_name      = "frontend-pip"
    allocation_method   = "Static"
    sku                 = "Standard"
    resource_group_name = "demo-rg"
    location            = "centralindia"
    tags                = {}
  }
}

# ------------------------ #
# NICs
# ------------------------ #
nics = {
  frontendvm = {
    network_interface_name = "frontendvm-nic"
    location               = "centralindia"
    resource_group_name    = "demo-rg"

    ip_configuration = {
      ip1 = {
        name                          = "frontend-ip"
        private_ip_address_allocation = "Dynamic"
        vnet                          = "prod-vnet"
        subnet                        = "web-subnet"
      }
    }
  }

  backendvm = {
    network_interface_name = "backendvm-nic"
    location               = "centralindia"
    resource_group_name    = "demo-rg"

    ip_configuration = {
      ip1 = {
        name                          = "backend-ip"
        private_ip_address_allocation = "Dynamic"
        vnet                          = "prod-vnet"
        subnet                        = "app-subnet"
      }
    }
  }
}

# ------------------------ #
# VMs
# ------------------------ #
vms = {
  frontendvm = {
    vm_name                         = "frontendvm"
    location                        = "centralindia"
    resource_group_name             = "demo-rg"
    network_interface_name          = "frontendvm-nic"
    vm_size                         = "Standard_B2s"
    admin_username                  = "azureuser"
    admin_password                  = "Password@123"
    disable_password_authentication = false

    delete_os_disk_on_termination    = true
    delete_data_disks_on_termination = true

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }

    storage_os_disk = {
      name              = "frontend-osdisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }

    tags = {
      role = "frontend"
    }
  }

  backendvm = {
    vm_name                = "backendvm"
    location               = "centralindia"
    resource_group_name    = "demo-rg"
    network_interface_name = "backendvm-nic"
    vm_size                = "Standard_B2s"

    admin_username                  = "azureuser"
    admin_password                  = "Password@123"
    disable_password_authentication = false

    delete_os_disk_on_termination    = true
    delete_data_disks_on_termination = true

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }

    storage_os_disk = {
      name              = "backend-osdisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }

    tags = {
      role = "backend"
    }
  }
}
