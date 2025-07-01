#  NIC creation
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}

