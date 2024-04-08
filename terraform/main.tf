terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "backend" {
    source = "./modules/remote_backend"
    iam_user_name = var.iam_user_name
    bucket_name = var.bucket_name
}

output "iam_user_name" {
    value = module.backend.iam_user_arn
}