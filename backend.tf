terraform {
  backend "azurerm" {
    resource_group_name   = "tfstate-rg"
    storage_account_name  = "tfstateacctsmith2025"
    container_name        = "tfstate"
    key                   = "terraform-modules-project.tfstate"  # 👈 unique key
  }
}
