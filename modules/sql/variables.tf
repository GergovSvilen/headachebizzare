variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "database_name" {
  description = "Name of the SQL database"
  type        = string
}

variable "admin_username" {
  description = "SQL Server administrator username"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "SQL Server administrator password"
  type        = string
  sensitive   = true
}

variable "database_sku" {
  description = "SKU name for the SQL database"
  type        = string
  default     = "S0"
}

variable "database_collation" {
  description = "Collation for the SQL database"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "database_max_size_gb" {
  description = "Maximum size of the database in GB"
  type        = number
  default     = 5
}

variable "tags" {
  description = "Tags to apply to the SQL Server and database"
  type        = map(string)
  default     = {}
}