# Create (and display) an SSH key
resource "tls_private_key" "private-ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
output "tls_private_key" { value = tls_private_key.private-ssh.private_key_pem }

# Create virtual machine
resource "azurerm_linux_virtual_machine" "virtual-machine" {
  name                  = "myVM"
  location              = "eastus"
  resource_group_name   = azurerm_resource_group.resource-group.name
  network_interface_ids = [azurerm_network_interface.network-interface.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.private-ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage-account.primary_blob_endpoint
  }

  tags = local.tags_any
}
