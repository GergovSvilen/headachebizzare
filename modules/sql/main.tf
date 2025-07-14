terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  tags = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  name           = var.database_name
  server_id      = azurerm_mssql_server.sql_server.id
  sku_name       = var.database_sku
  collation      = var.database_collation
  max_size_gb    = var.database_max_size_gb

  tags = var.tags
}

