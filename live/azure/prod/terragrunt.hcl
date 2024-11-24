include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "https://github.com/dashg-enterprises/cloud-platform.git//src/resources/azure"
}

inputs = {
    # application_image = "624626124579.dkr.ecr.us-east-1.amazonaws.com/myfargateboundedcontextimages:latest"
    environment_name = "prod"
}