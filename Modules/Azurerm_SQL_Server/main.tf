# SQL Server creation
resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = var.sql_version
  administrator_login          = data.azurerm_key_vault_secret.username.value
  administrator_login_password = data.azurerm_key_vault_secret.password.value
  minimum_tls_version          = var.minimum_tls_version
}


