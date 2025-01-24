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

module "SG" {
  source     = "./modules/SG"
  port       = 3000
  vpc_id     = module.VPC.vpc_id
  cidr_block = module.VPC.cidr_block
}

module "S3" {
  source      = "./modules/S3"
  bucket_name = local.bucket_name
}

module "IAM" {
  source     = "./modules/IAM"
  iam_name   = local.environment
  bucket_arn = module.S3.bucket_arn
}

module "ECS" {
  source            = "./modules/ECS"
  name              = local.environment
  cpu               = 256
  memory            = 512
  image             = "docker.io/korenp/unleash-exercise"
  image_tag         = var.image_tag
  port              = 3000
  replicas          = 1
  subnet_id         = module.VPC.subnet_id
  security_group_id = module.SG.security_group_id
  bucket_name       = local.bucket_name
  iam_arn           = module.IAM.iam_arn
}