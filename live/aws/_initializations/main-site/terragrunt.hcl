include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/main-site.git//iac/initialization?ref=main"
}

inputs = {
}