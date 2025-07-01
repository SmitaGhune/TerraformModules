provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "rg" {
  source      = "./modules/resource_group"
  name        = var.rg_name
  location    = var.location
}

module "network" {
  source      = "./modules/network"
  vnet_name   = var.vnet_name
  subnet_name = var.subnet_name
  rg_name     = module.rg.name
  location    = var.location
}

module "vm" {
  source         = "./modules/vm"
  vm_name        = var.vm_name
  location       = var.location
  rg_name        = module.rg.name
  subnet_id      = module.network.subnet_id
  admin_username = var.admin_username
  admin_password = var.admin_password
}
