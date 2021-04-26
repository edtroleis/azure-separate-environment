# Resource Group
variable "location" {
  description = "Location where the resources will be created"
  type        = string
}

variable "resource_name" {
  description = "Name of the resource group"
  type        = string
}

# Storage account properties
variable "storage_account_name" {
  description = "Name of storage account. Must be unique in Azure"
  type        = string
}

variable "account_tier" {
  description = ""
  type        = string
}

variable "account_replication_type" {
  description = "Define the redundency storage type"
  type        = string
}

variable "access_tier" {
  description = "Define if backup will be in Hot or Cold mode"
  type        = string
}

variable "account_kind" {
  description = "account_kind"
  type        = string
}

variable "allow_blob_public_access" {
  description = "allow_blob_public_access"
  type        = string
}

variable "file_share_name" {
  description = "Storage account file share name"
  type        = string
}

# Network
variable "subnet_name" {
  description = "subnet_name"
  type        = string
}

variable "vnet_name" {
  description = "vnet_name"
  type        = string
}

variable "public_ip_name" {
  description = "public_ip_name"
  type        = string
}

variable "allocation_method" {
  description = "allocation_method"
  type        = string
}

variable "security_group_name" {
  description = "security_group_name"
  type        = string
}

variable "network_interface_name" {
  description = "network_interface_name"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "private_ip_address_allocation"
  type        = string
}

# Tags
variable "environment" {
  description = "Subscription where the resource will be deployed"
  type        = string
}

variable "iac" {
  description = "Define if the infrastructure was created with code and which one {terraform/arm/az-cli}"
  type        = string
}

variable "objective" {
  description = "System objective which resource was built for"
  type        = string
}

variable "owner" {
  description = "Responsible team for the system/resource"
  type        = string
}

variable "system" {
  description = "System"
  type        = string
}
