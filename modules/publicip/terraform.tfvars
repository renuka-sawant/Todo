vmpip = {
  vm1 = {
    public_ip_name      = "frontend-public"
    resource_group_name = "rg-fore1"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      environment = "staging"
      role = "frontend"
    }
  }
}