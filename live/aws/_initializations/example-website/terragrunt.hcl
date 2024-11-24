include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/typescript-boilerplates-web.git//iac/initialization?ref=main"
}

inputs = {
}