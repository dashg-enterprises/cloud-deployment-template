include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/dashg-enterprises/lambda-boilerplate.git//iac?ref=main"
}

locals {
  command_handler_build_id   = "main__command-handler__188c1a4f6e085012caf3b81d6e70bc32eb66be8c.zip"
  view_materializer_build_id = "main__view-materializer__188c1a4f6e085012caf3b81d6e70bc32eb66be8c.zip"
  environment                = "dev"
}

inputs = {
  environment_name  = "${local.environment}"
  build_bucket_name = "examplecontext-builds"
  handlers = [{
    name          = "command-handler-${local.environment}"
    build_id      = local.command_handler_build_id
    event_sources = []
    }, {
    name          = "view-materializer-${local.environment}"
    build_id      = local.view_materializer_build_id
    event_sources = []
  }]
}
