terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# provider "azurerm" {
#   features {}
#   subscription_id = "987e5914-628e-4e9a-8c8f-d7fa87735002"
# }

provider "azurerm" {
  features {}
  subscription_id = "ee55a7e2-756d-4853-b460-100f44600bcd"
  tenant_id       = "9abeb0f5-f145-4203-8087-f1219e28201b"
}


