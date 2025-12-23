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
  subscription_id = "5c7f45f9-d164-407a-89a6-f9bfb1653dc9"
  tenant_id       = "613fa3fe-9393-4438-8412-f6bab6becd8d"
  # tenant_id = 613fa3fe-9393-4438-8412-f6bab6becd8d
}


