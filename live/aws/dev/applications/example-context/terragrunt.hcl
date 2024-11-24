include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/dashg-enterprises/typescript-boilerplates.git//iac?ref=main"
}

dependencies {
  paths = ["../../environment"] # not dry
}

dependency "environment" {
  config_path = "../../environment" # not dry
}

locals {
  application_image = "624626124579.dkr.ecr.us-east-1.amazonaws.com/examplecontextimages:3d9c1e0719073a10269ec98c33df81290346a286"
}

inputs = {
  application_image = local.application_image
  environment_name  = "dev"
  vpc = {
    id                 = dependency.environment.outputs.vpc_id
    private_subnet_ids = dependency.environment.outputs.private_subnet_ids
    public_subnet_ids  = dependency.environment.outputs.public_subnet_ids
  }
}