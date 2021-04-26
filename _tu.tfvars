# Resource group
location      = "brazilsouth"
resource_name = "rg-vm-linux"

# Storage account properties
storage_account_name     = "vm-linux"
account_tier             = "Standard"
account_replication_type = "LRS"
access_tier              = "Hot"
account_kind             = "StorageV2"
allow_blob_public_access = "true"
file_share_name          = "bamboo-agents-volume"

# Network
subnet_name                   = "subnet-vm-linux"
vnet_name                     = "vnet-vm-linux"
public_ip_name                = "vm-linux-public-ip"
allocation_method             = "Dynamic"
security_group_name           = "sg-vm-linux"
network_interface_name        = "interface-vm-linux"
nic_configuration_name        = "vm-linux-nic-configuration"
private_ip_address_allocation = "Dynamic"

# Tags
environment = "tu"                                   # Subscription where the resource will be deployed
iac         = "terraform"                            # Define if the infrastructure was created with code and which one {terraform/arm/az-cli}
objective   = "Bamboo stack used for CI/CD on Azure" # System objective which resource was built for
owner       = "Cloud/DevOps"                         # Responsible team for the system/resource 
system      = ""                                     # System