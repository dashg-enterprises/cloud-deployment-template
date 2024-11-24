include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/dashg-enterprises/lambda-boilerplate-demonstration.git//iac?ref=main"
}

dependencies {
  paths = ["../lambda-boilerplate"]
}

dependency "lambda_boilerplate" {
  config_path = "../lambda-boilerplate"
}

inputs = {
  environment_name = "dev"
  build_bucket_name = "demonstrationcontext-builds"
  handlers = [ {
    name = "demonstration-event-handler-dev"
    build_id = "main__event-handler__cdc00110d8252bd0dfcd643f1efbe971af76ace7.zip"
    event_sources = [ dependency.lambda_boilerplate.outputs.event_topic_arn ]
  }]
}