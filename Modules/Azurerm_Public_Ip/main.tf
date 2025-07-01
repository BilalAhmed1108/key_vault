# PIP creation
resource "azurerm_public_ip" "pip" {
  name                = var.pipname
  resource_group_name = var.rg_name
  location            = var.rg_locaion
  allocation_method   = var.allocationmethod
}