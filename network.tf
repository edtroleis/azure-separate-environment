# Create virtual network
resource "azurerm_virtual_network" "virtual-network" {
    name                = var.vnet_name
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.resource-group.location
    resource_group_name = azurerm_resource_group.resource-group.name

    tags = local.tags_any
}

# Create subnet
resource "azurerm_subnet" "subnet" {
    name                 = var.vnet_name
    resource_group_name  = azurerm_resource_group.resource-group.name
    virtual_network_name = azurerm_virtual_network.virtual-network.name
    address_prefixes       = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "vm-linux-public-ip" {
    name                         = var.public_ip_name
    location                     = azurerm_resource_group.resource-group.location
    resource_group_name          = azurerm_resource_group.resource-group.name
    allocation_method            = var.allocation_method

    tags = local.tags_any
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "security-group" {
    name                = var.security_group_name
    location            = azurerm_resource_group.resource-group.location
    resource_group_name = azurerm_resource_group.resource-group.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = local.tags_any
}

# Create network interface
resource "azurerm_network_interface" "network-interface" {
    name                      = var.network_interface_name
    location                  = azurerm_resource_group.resource-group.location
    resource_group_name       = azurerm_resource_group.resource-group.name

    ip_configuration {
        name                          = "vm-linux-nic-configuration" #var.nic_configuration_name
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = var.private_ip_address_allocation
        public_ip_address_id          = azurerm_public_ip.vm-linux-public-ip.id
    }

    tags = local.tags_any
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "vm-linux-nic-association" {
    network_interface_id      = azurerm_network_interface.network-interface.id
    network_security_group_id = azurerm_network_security_group.security-group.id
}