# Data block variable
variable "nic_name" {}
variable "key_vault_name" {}  # "B18-Locker"
# variable "keyvaultrgname" {} # "RG-B18"
#variable "rg_name_keyvault_dev" {}
variable "secret_name" {}  # "bilalvmusername"
variable "secret_password" {}  # "bilalvmpassword"

# Virtual Machine variables
variable "rg_location" {}
variable "rg_name" {}
variable "vm_name" {}
#variable "rg_name" {}
#variable "rg_location" {}
variable "vm_size" {} # "Standard_F2"
variable "disable_password_authentication" {} # False
#variable "admin_username" {}
#variable "admin_password" {}
# variable "disable_password_authentication" {}  # false
variable "caching" {}   # ReadWrite
variable "storage_account_type" {}   # Standard_LRS
variable "publisher" {} # Canonical
variable "offer" {}    # 0001-com-ubuntu-server-jammy
variable "sku" {}  # 22_04-lts
variable "vm_version" {}  # latest
