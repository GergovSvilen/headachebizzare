output "sql_server_name" {
  description = "Name of the Azure SQL Server"
  value       = azurerm_mssql_server.sql_server.name
}

output "sql_server_id" {
  description = "ID of the Azure SQL Server"
  value       = azurerm_mssql_server.sql_server.id
}

output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name of the Azure SQL Server"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_database_name" {
  description = "Name of the Azure SQL Database"
  value       = azurerm_mssql_database.sql_db.name
}

output "sql_database_id" {
  description = "Resource ID of the Azure SQL Database"
  value       = azurerm_mssql_database.sql_db.id
}

output "connection_string" {
  description = "Connection string for the SQL database"
  value       = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Database=${azurerm_mssql_database.sql_db.name};User ID=${var.admin_username};Password=${var.admin_password};Encrypt=true;TrustServerCertificate=false;Connection Timeout=30;"
  sensitive   = true
}
