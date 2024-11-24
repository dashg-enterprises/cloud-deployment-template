include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/dashg-enterprises/typescript-boilerplates-web.git//iac?ref=main"
}

locals {
  build_id = "main__6ea727dd2baf70a3fdc4e71b0c28420fc9b2c82e.zip"
}

inputs = {
  environment           = "dev"
  environment_subdomain = "dev" // e.g. 'www' for prod
  build_id              = local.build_id
}