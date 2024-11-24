include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/dashg-enterprises/typescript-k8s-template.git//iac?ref=main"
}

dependencies {
  paths = ["../../environment"] # not dry
}

dependency "environment" {
  config_path = "../../environment" # not dry
}

generate "k8s_provider" {
  path = "k8s-provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.eks_cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
EOF
}

inputs = {
    # application_image = "nginx:1.7.8"
    application_image = "624626124579.dkr.ecr.us-east-1.amazonaws.com/k8scontextimages:65fa16c72537866b12e59626d8cc38be20cf53f9"
    environment_name = "dev"
    eks_cluster_name = dependency.environment.outputs.eks_cluster_name
}