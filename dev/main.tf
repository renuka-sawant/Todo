
# -------------------------------
# RESOURCE GROUPS
# -------------------------------
module "rg" {
  source = "../modules/RG"
  rgvar  = var.rgvar
}

# -------------------------------
# NETWORK (VNET + SUBNETS)
# -------------------------------
module "network" {
  source     = "../modules/network"
  networks   = var.networks
  depends_on = [module.rg]
}

# -------------------------------
# STORAGE ACCOUNTS
# -------------------------------
module "storage" {
  source     = "../modules/storage"
  mystorage  = var.mystorage
  depends_on = [module.rg]
}

# -------------------------------
# PUBLIC IP FOR FRONTEND
# -------------------------------
// top-level publicip removed: use VM's internal publicip module instead

# -------------------------------
# KEY VAULTS
# -------------------------------
module "keyvault" {
  source     = "../modules/keyvalut"
  keyvaults  = var.keyvaults
  depends_on = [module.rg]
}

# -------------------------------
# FRONTEND + BACKEND VMS
# -------------------------------
module "vm" {
  source     = "../modules/vm"
  vms        = var.vms
  nics       = var.nics
  subnet_ids = module.network.subnet_ids
  vmpip      = var.vmpip

  depends_on = [
    module.rg,
    module.network
  ]
}
