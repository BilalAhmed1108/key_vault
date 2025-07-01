# Virtual Machine creation
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  disable_password_authentication = var.disable_password_authentication

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.vm_version
  }
  # cloud-init script for NGINX installation
  custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF
  )

}