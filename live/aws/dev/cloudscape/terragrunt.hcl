include "root" {
  path = find_in_parent_folders()
}

locals {
  organization_name = "dashg-enterprises"
}

terraform {
    source = "git::https://github.com/${local.organization_name}/cloud-infrastructure.git//iac/aws/cloudscape?ref=main" // should point to a particular project repo
}

inputs = {
    environment_name = "dev"
    environment_subdomain = "dev" // e.g. 'www' for prod
}