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

inputs = {
    application_image = "624626124579.dkr.ecr.us-east-1.amazonaws.com/examplecontextimages:latest"
    environment_name = "prod"
    vpc = {
      id = dependency.environment.outputs.vpc_id
      private_subnet_ids = dependency.environment.outputs.private_subnet_ids
      public_subnet_ids = dependency.environment.outputs.public_subnet_ids
    }
}