terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
  backend "azurerm" {}

}


provider "azurerm" {
  features {}
}

#Create virtual network
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-prod-westus-001"
  address_space       = ["10.1.0.0/16"]
  location            = "westus"
  resource_group_name = "cal-501-23"
}

# Create subnet
resource "azurerm_subnet" "subnet1" {
  name                 = "snet-prod-westus-001"
  resource_group_name  = "cal-501-23"
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.1.0.0/24"]
}