include "root" {
  path = find_in_parent_folders()
}

locals {
  organization_name = "dashg-enterprises"
}

terraform {
    source = "git::https://github.com/${local.organization_name}/cloud-infrastructure.git//iac/aws/cloudscape?ref=main"
}

inputs = {
    environment_name = "uat"
    environment_subdomain = "uat" // e.g. 'www' for prod
}