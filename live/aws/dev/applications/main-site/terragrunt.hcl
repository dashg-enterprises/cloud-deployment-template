include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/main-site.git//iac?ref=main"
}

inputs = {
    environment = "dev"
    environment_subdomain = "dev"
}