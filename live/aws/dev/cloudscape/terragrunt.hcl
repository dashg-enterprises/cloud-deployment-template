include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/cloud-infrastructure.git//resources/aws/cloudscape?ref=main" // should point to a particular project repo
}

inputs = {
    environment_name = "dev"
    environment_subdomain = "dev" // e.g. 'www' for prod
}