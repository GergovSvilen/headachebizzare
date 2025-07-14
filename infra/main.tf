
locals {
  tags = {
    Environment = "test"
    Project     = "test-check"
    ManagedBy   = "Terraform"
    # Add other common tags here
  }
}
module "rg" {
  source = "../modules/rg"

  rg_name = "test-sg"
  rg_location = "centralus"
  tags     = local.tags
}

module "aks" {
  source = "../modules/aks" # Update this path

  cluster_name        = "test-sg-aks"
  resource_group_name = "test-sg"
  location            = "centralus"
  dns_prefix          = "akssgpreff"
  node_count          = 2
  tags                = local.tags
   depends_on = [module.rg]
}


module "keyvault" {
  source = "../modules/keyvault"

  key_vault_name       = "sg-test-kv"
  location             = "centralus"
  resource_group_name  = "test-sg"
  tenant_id            = "f976abbe-fa68-4d4f-bcf7-7038d98c8385"

  tags = {
    environment = "dev"
    owner       = "sg-test"
  }


}

resource "azurerm_user_assigned_identity" "kes_identity" {
  name                = "kes-identity"
  location            = "centralus"
  resource_group_name = "test-sg"
}



resource "azurerm_role_assignment" "kv_secrets_user" {
  scope                = module.keyvault.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.kes_identity.principal_id
}


# # Create the SQL Server (admin password stored in Key Vault, passed as variable)
# resource "azurerm_mssql_server" "sql_server" {
#   name                         = "sql-test-sg"
#   resource_group_name          = "test-sg"
#   location                     = "centralus"
#   version                      = "12.0"
#   administrator_login          = var.admin_username
#   administrator_login_password = var.admin_password # Passed securely from KV or tfvars

  
# }

# # Create the SQL database
# resource "azurerm_mssql_database" "sql_db" {
#   name           = "sg-db"
#   server_id      = azurerm_mssql_server.sql_server.id
#   sku_name       = "Basic"
#   collation      = "SQL_Latin1_General_CP1_CI_AS"
#   max_size_gb    = 2

  
# }
