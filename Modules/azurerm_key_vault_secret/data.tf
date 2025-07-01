# Key Vault Data Block
data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.rg_name
}