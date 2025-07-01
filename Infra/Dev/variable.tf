# RG variables
variable "rg_name_dev" {}
variable "rg_location_dev" {}

# Storage Account variables
variable "storage_name_dev" {}
#variable "rg_name" {}
#variable "rg_location" {}
variable "account_tier_dev" {}
variable "account_replication_type_dev" {}

# VNET variables   ["10.0.0.0/16"]
variable "vnet_name_dev" {}
#variable "rg_name" {}
#variable "rg_location" {}
variable "address_space_dev" {}

# Frontend Subnet variable  
variable "frontend_subnet_name_dev" {}
#variable "rg_name" {}
#variable "vnet_name" {}
variable "frontend_address_prefixes_dev" {}

# Backend Subnet variable 
variable "backend_subnet_name_dev" {}
#variable "rg_name" {}
#variable "vnet_name" {}
variable "backend_address_prefixes_dev" {}

# Frontend PIP variables
variable "frontend_pipname_dev" {}
#variable "rg_name" {}
#variable "rg_locaion" {}
variable "frontend_allocationmethod_dev" {}

# Backend PIP variables
variable "backend_pipname_dev" {}
#variable "rg_name" {}
#variable "rg_locaion" {}
variable "backend_allocationmethod_dev" {} # Static

# Frontend NIC variables
variable "frontend_nic_name_dev" {}
#variable "rg_location" {}
#variable "rg_name" {}
variable "ip_name_dev" {} # "internal"
variable "frontend_private_ip_address_allocation_dev" {}

# Backend NIC variables
variable "backend_nic_name_dev" {}
#variable "rg_location" {}
#variable "rg_name" {}
#variable "ip_name" {}     # "internal"
variable "backend_private_ip_address_allocation_dev" {}

# Frontend Virtual Machine variables
variable "frontend_vm_name_dev" {}
#variable "rg_name" {}
#variable "rg_location" {}
variable "vm_size_dev" {} # 
#variable "admin_username_dev" {}
#variable "admin_password_dev" {}
variable "disable_password_authentication_dev" {}
variable "caching_dev" {}
variable "storage_account_type_dev" {}
variable "publisher_dev" {}
variable "offer_dev" {}
variable "sku_dev" {}
variable "vm_version_dev" {}

# Backend Virtual Machine variables
variable "backend_vm_name_dev" {}
#variable "rg_name" {}
#variable "rg_location" {}
#variable "vm_size" {} # "Standard_F2"
#variable "admin_username" {}
#variable "admin_password" {}
#variable "disable_password_authentication" {}  # false
#variable "caching" {}   # ReadWrite
#variable "storage_account_type" {}   # Standard_LRS
#variable "publisher" {} # Canonical
#variable "offer" {}    # 0001-com-ubuntu-server-jammy
#variable "sku" {}  # 22_04-lts
#variable "vm_version" {}  # latest

# SQL Server variable
variable "sqlserver_name_dev" {}
#variable "rg_name" {}
#variable "rg_location" {}
variable "sql_version_dev" {}
#variable "admin_username" {}
#variable "admin_password" {}
variable "minimum_tls_version_dev" {}

# SQL Database variable
variable "sqldatabase_name_dev" {}

# Key VAult vvariables
variable "key_vault_name_dev" {}
#variable "rg_location_keyvault_dev" {}
#variable "rg_name_keyvault_dev" {}
variable "enabled_for_disk_encryption_dev" {}
variable "soft_delete_retention_days_dev" {}
variable "purge_protection_enabled_dev" {}
variable "sku_name_dev" {}

# Data Block variable
#variable "keyvaultname_dev" {}     # "B18-Locker"
#variable "keyvaultrgname_dev" {}   # "RG-B18"
#variable "keyvaultusername_dev" {} # "bilalvmusername"
#variable "keyvaultpassword_dev" {} # "bilalvmpassword"

# Key Vault Secret Variables Username
variable "secret_username_dev" {}
variable "secret_username_value_dev" {}

# Key Vault Secret Variables Password
variable "secret_password_dev" {}
variable "secret_password_value_dev" {}