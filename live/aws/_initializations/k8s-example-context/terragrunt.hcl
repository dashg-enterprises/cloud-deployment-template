include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/dashg-enterprises/typescript-k8s-template.git//iac/initialization?ref=main"
}

inputs = {
}