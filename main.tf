terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

  subscription_id ="f795af05-a6af-4abd-bad7-751e5909d3df"
  client_id = "fd408414-aee8-4150-b4f7-5e9026d3bbcc"
  client_secret = "MkW8Q~wSHe0zfaAE2EAe2U6exSnm7MAQnDF5zbyA"
  tenant_id = "3d7d5d74-2058-4a23-9e35-8220868fe859"
}

resource "azurerm_ resource_group" "sunny1" {
  name     = "ramagiri"
  location = "West Europe"
}

resource "azurerm virtual _network" "sunny1" {
  name                = "ramagirivnet"
  location            = azurerm_resource_group.sunny1.location
  resource_group_name = azurerm_resource_group.sunny1.name
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "ramagiri" {
  name                 = "ramagiri"
  resource_group_name  = azurerm_resource_group.sunny1.location
  virtual_network_name = azurerm_virtual_network.ramagiri1.name
  address_prefixes     = ["10.10.1.0/24"]
}
