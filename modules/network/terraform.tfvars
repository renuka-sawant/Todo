networks = {
  vnet1 = {
    name                = "vnet1"
    resource_group_name = "rg-fore1"
    location            =  "East US"
    address_space       = ["10.0.0.0/16"]
    tags = {
      env  = "dev"
      dept = "IT"
    }
    subnets = {
      sub1 = {
        name             = "frontendsubnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
      sub2 = {
        name             = "backendsubnet1"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
#   vnet2 = {
#     name                = "vnet2"
#     resource_group_name = "rg-fore2"
#     location            = "eastus"
#     address_space       = ["10.1.0.0/16"]
#     tags = {
#       env  = "prod"
#       dept = "IT"
#     }
#     subnets = {
#       sub1 = {
#         name             = "appsubnet2"
#         address_prefixes = ["10.1.1.0/24"]
#       }
#     }
#   }
}