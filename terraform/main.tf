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

module "s3_web_main" {
  source = "./modules/s3_web_main"
  web_bucket = var.web_bucket
  index_document = var.index_document
  region = var.region
}