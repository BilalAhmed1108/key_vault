 # Key Vault variables
variable "key_vault_name" {}
variable "rg_name" {}
variable "rg_location" {}
variable "enabled_for_disk_encryption" {}  # true
variable "soft_delete_retention_days" {} # "7"
variable "purge_protection_enabled" {}  # false

variable "sku_name" {} # "standard"