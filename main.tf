provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source         = "./modules/resourcegroup"
  name           = var.name
  location       = var.location
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
}

module "securitygroup" {
  source         = "./modules/securitygroup"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  web_subnet_id  = module.networking.websubnet_id
  app_subnet_id  = module.networking.appsubnet_id
  db_subnet_id   = module.networking.dbsubnet_id
}

module "compute" {
  source         = "./modules/compute"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  web_subnet_id = module.networking.websubnet_id
  app_subnet_id = module.networking.appsubnet_id
  web_host_name = var.web_host_name
  web_username = var.web_username
  web_os_password = var.web_os_password
  app_host_name = var.app_host_name
  app_username = var.app_username
  app_os_password = var.app_os_password
}