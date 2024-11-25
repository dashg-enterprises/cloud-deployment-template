include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/cloud-infrastructure.git//resources/aws/cloudscape?ref=main"
}

inputs = {
    environment_name = "uat"
    environment_subdomain = "uat" // e.g. 'www' for prod
}