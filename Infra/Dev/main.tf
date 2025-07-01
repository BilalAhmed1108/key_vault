# RG Module
module "rg" {
  source      = "../../Modules/Azurerm_Resource_Group"
  rg_name     = var.rg_name_dev
  rg_location = var.rg_location_dev
}

# Storgae Module
module "storgae" {
  depends_on               = [module.rg]
  source                   = "../../Modules/Azurerm_Storage_Account"
  storage_name             = var.storage_name_dev
  rg_name                  = var.rg_name_dev
  rg_location              = var.rg_location_dev
  account_tier             = var.account_tier_dev
  account_replication_type = var.account_replication_type_dev
}

# Vnet Module
module "vnet" {
  depends_on    = [module.rg]
  source        = "../../Modules/Azurerm_Vnet"
  vnet_name     = var.vnet_name_dev
  rg_location   = var.rg_location_dev
  rg_name       = var.rg_name_dev
  address_space = var.address_space_dev
}

# Frontend Subnet Module
module "frontend_subnet" {
  depends_on       = [module.vnet]
  source           = "../../Modules/Azurerm_Subnet"
  subnet_name      = var.frontend_subnet_name_dev
  rg_name          = var.rg_name_dev
  vnet_name        = var.vnet_name_dev
  address_prefixes = var.frontend_address_prefixes_dev
}

# Backend Subnet Module
module "backend_subnet" {
  depends_on       = [module.vnet]
  source           = "../../Modules/Azurerm_Subnet"
  subnet_name      = var.backend_subnet_name_dev
  rg_name          = var.rg_name_dev
  vnet_name        = var.vnet_name_dev
  address_prefixes = var.backend_address_prefixes_dev
}

# Key Vault Module
module "keyvault" {
  depends_on                  = [module.rg]
  source                      = "../../Modules/azurerm_key_vault"
  key_vault_name              = var.key_vault_name_dev
  rg_location                 = var.rg_location_dev
  rg_name                     = var.rg_name_dev
  enabled_for_disk_encryption = var.enabled_for_disk_encryption_dev
  soft_delete_retention_days  = var.soft_delete_retention_days_dev
  purge_protection_enabled    = var.purge_protection_enabled_dev
  sku_name                    = var.sku_name_dev
}

# Key Vault Secret Username Module
module "secret_username" {
  depends_on            = [module.keyvault]
  source                = "../../Modules/azurerm_key_vault_secret"
  key_vault_name        = var.key_vault_name_dev
  rg_name               = var.rg_name_dev
  secret_name       = var.secret_username_dev
  secret_value = var.secret_username_value_dev
}

# Key Vault Secret Password Module
module "secret_password" {
 depends_on            = [module.keyvault]
  source                = "../../Modules/azurerm_key_vault_secret"
  key_vault_name        = var.key_vault_name_dev
  rg_name               = var.rg_name_dev
  secret_name      = var.secret_password_dev
  secret_value = var.secret_password_value_dev
}
# SQL Server Module
module "SQLServer" {
  depends_on           = [module.rg, module.secret_username, module.secret_username]
  source               = "../../Modules/Azurerm_SQL_Server"
  sqlserver_name       = var.sqlserver_name_dev
  rg_name              = var.rg_name_dev
  #rg_name_keyvault_dev = var.key_vault_name_dev
  rg_location          = var.rg_location_dev
  sql_version          = var.sql_version_dev
  #admin_username      = var.admin_username_dev
  #admin_password      = var.admin_password_dev
  key_vault_name      = var.key_vault_name_dev
  secret_name     = var.secret_username_dev
  secret_password     = var.secret_password_dev
  minimum_tls_version = var.minimum_tls_version_dev
}

# SQL Database
module "SQLDatabase" {
  depends_on       = [module.SQLServer]
  source           = "../../Modules/Azurerm_SQL_Database"
  sqldatabase_name = var.sqldatabase_name_dev
  sqlservername    = var.sqlserver_name_dev
  rg_name          = var.rg_name_dev
}

# Frontend Public IP Address Module
module "frontend_PIP" {
  depends_on       = [module.rg]
  source           = "../../Modules/Azurerm_Public_Ip"
  pipname          = var.frontend_pipname_dev
  rg_name          = var.rg_name_dev
  rg_locaion       = var.rg_location_dev
  allocationmethod = var.frontend_allocationmethod_dev
}

# Backend Public IP Address Module
module "backend_PIP" {
  depends_on       = [module.rg]
  source           = "../../Modules/Azurerm_Public_Ip"
  pipname          = var.backend_pipname_dev
  rg_name          = var.rg_name_dev
  rg_locaion       = var.rg_location_dev
  allocationmethod = var.backend_allocationmethod_dev
}

#  Frontend NIC Module
module "frontend_nic" {
  depends_on                    = [module.frontend_subnet, module.frontend_PIP]
  source                        = "../../modules/azurerm_network_interface_card"
  subnet_name                   = var.frontend_subnet_name_dev
  vnet_name                     = var.vnet_name_dev
  pip_name                      = var.frontend_pipname_dev
  nic_name                      = var.frontend_nic_name_dev
  rg_location                   = var.rg_location_dev
  rg_name                       = var.rg_name_dev
  ip_name                       = var.ip_name_dev
  private_ip_address_allocation = var.frontend_private_ip_address_allocation_dev
}

#  Backend NIC Module
module "backend_nic" {
  depends_on                    = [module.backend_subnet, module.backend_PIP]
  source                        = "../../modules/azurerm_network_interface_card"
  subnet_name                   = var.backend_subnet_name_dev
  vnet_name                     = var.vnet_name_dev
  pip_name                      = var.backend_pipname_dev
  nic_name                      = var.backend_nic_name_dev
  rg_location                   = var.rg_location_dev
  rg_name                       = var.rg_name_dev
  ip_name                       = var.ip_name_dev
  private_ip_address_allocation = var.backend_private_ip_address_allocation_dev
}

# Frontend VM Module
module "frontend_VM" {
  depends_on                      = [module.frontend_PIP, module.frontend_nic, module.secret_username, module.secret_username]
  source                          = "../../Modules/Azurerm_Virtual_Machine"
  nic_name                        = var.frontend_nic_name_dev
  vm_name                         = var.frontend_vm_name_dev
  rg_name                         = var.rg_name_dev
  rg_location                     = var.rg_location_dev
  vm_size                         = var.vm_size_dev
  disable_password_authentication = var.disable_password_authentication_dev
  key_vault_name                  = var.key_vault_name_dev
  #rg_name_keyvault_dev            = var.rg_name_keyvault_dev
  secret_name                 = var.secret_username_dev
  secret_password                 = var.secret_password_dev
  # admin_username                  = var.admin_username_dev
  # admin_password                  = var.admin_password_dev
  # disable_password_authentication = var.disable_password_authentication_dev
  caching              = var.caching_dev
  storage_account_type = var.storage_account_type_dev
  publisher            = var.publisher_dev
  offer                = var.offer_dev
  sku                  = var.sku_dev
  vm_version           = var.vm_version_dev

}

# Backend VM Module
module "backend_VM" {
  source                          = "../../Modules/Azurerm_Virtual_Machine"
  depends_on                      = [module.backend_PIP, module.backend_nic, module.secret_username, module.secret_username]
  nic_name                        = var.backend_nic_name_dev
  vm_name                         = var.backend_vm_name_dev
  rg_name                         = var.rg_name_dev
  rg_location                     = var.rg_location_dev
  vm_size                         = var.vm_size_dev
  disable_password_authentication = var.disable_password_authentication_dev
  key_vault_name                  = var.key_vault_name_dev
  #rg_name_keyvault_dev            = var.rg_name_keyvault_dev
  secret_name                = var.secret_username_dev
  secret_password                 = var.secret_password_dev
  # admin_username                  = var.admin_username_dev
  # admin_password                  = var.admin_password_dev
  # disable_password_authentication = var.disable_password_authentication_dev
  caching              = var.caching_dev
  storage_account_type = var.storage_account_type_dev
  publisher            = var.publisher_dev
  offer                = var.offer_dev
  sku                  = var.sku_dev
  vm_version           = var.vm_version_dev

}


