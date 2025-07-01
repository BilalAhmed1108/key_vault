# SQL Server variable
variable "sqlserver_name" {}
variable "rg_name" {}
variable "rg_location" {}
variable "sql_version" {}   # "12.0"
#variable "admin_username" {}
#variable "admin_password" {}
variable "minimum_tls_version" {}  # "1.2"

# Data Block Variables
variable "key_vault_name" {}  # "B18-Locker"
#variable "keyvaultrgname" {} # "RG-B18"
#variable "rg_name_keyvault_dev"{}
variable "secret_name" {}  # "bilalvmusername"
variable "secret_password" {}  # "bilalvmpassword"



