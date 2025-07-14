output "resource_group_name" {
  value = module.rg.resource_group_name
}

output "resource_group_id" {
  value = module.rg.resource_group_id
}

output "key_vault_id" {
  value =module.keyvault.key_vault_id
}

# output "sql_server_id" {
#   value = azurerm_mssql_server.sql_server.id
# }
