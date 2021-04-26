locals {
  tags_any = {
    "Environment" = var.environment # Subscription where the resource will be deployed
    "IaC"         = var.iac         # Define if the infrastructure was created with code and which one {terraform/arm/az-cli}
    "Objective"   = var.objective   # System objective which resource was built for
    "Owner"       = var.owner       # Responsible team for the system/resource 
    "System"      = var.system      # System
  }
}
