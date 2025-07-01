# SQL Server Data block
data "azurerm_mssql_server" "SQLServer" {
  name                = var.sqlservername
  resource_group_name = var.rg_name
}


# SQL Database creation
resource "azurerm_mssql_database" "sqldatabase" {
  name         = var.sqldatabase_name
  server_id    = data.azurerm_mssql_server.SQLServer.id
}