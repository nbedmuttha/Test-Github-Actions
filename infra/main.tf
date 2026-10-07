hcl
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "northeurope"
}

resource "azurerm_resource_group" "dev" {
  name     = "rg-aiunit-dev"
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.dev.name
}
