terraform {
  backend "azurerm" {
    resource_group_name  = "MC_rg-aks-ldrt-cu-01_aks-main-ldrt-cu-02_centralus"
    storage_account_name = "testflowlogstela"
    container_name       = "tfstatetest"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_cli = false
}
