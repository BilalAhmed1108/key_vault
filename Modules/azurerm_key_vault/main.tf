# Data Block of client_config
data "azurerm_client_config" "current" {}




# Key Vault creation
resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.sku_name
#   enable_rbac_authorization = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", 
    ]

    secret_permissions = [
      "Get", "List","Set","Delete", "Purge",  
    ]

    storage_permissions = [
      "Get",
    ]
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }

}


# Role asignment to key vault
resource "azurerm_role_assignment" "kv_admin" {
  depends_on = [ azurerm_key_vault.key_vault ]
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}