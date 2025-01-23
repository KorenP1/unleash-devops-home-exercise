terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

module "VPC" {
  source = "./modules/VPC"
  name   = local.environment
}

module "S3" {
  source      = "./modules/S3"
  bucket_name = "${var.bucket_name}-${random_string.suffix.result}"
}

module "ECS" {
  source      = "./modules/ECS"
  name        = local.environment
  cpu         = 256
  memory      = 512
  image       = "docker.io/korenp/unleash-exercise"
  port        = 3000
  replicas    = 1
  subnet_id   = module.VPC.subnet_id
  bucket_name = "${var.bucket_name}-${random_string.suffix.result}"
}