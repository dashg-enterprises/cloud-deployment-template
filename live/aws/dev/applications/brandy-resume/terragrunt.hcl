include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/bgarland_resume2024.git//iac?ref=main"
}

inputs = {
    environment = "dev"
    environment_subdomain = "dev"
}