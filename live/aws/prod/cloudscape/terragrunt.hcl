include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/cloud-infrastructure.git//iac/aws/cloudscape?ref=main" // should point to a particular project repo
}

inputs = {
    environment_name = "prod"
    environment_subdomain = "www"
}