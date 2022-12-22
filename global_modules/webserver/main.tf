# AWS provider
provider "aws" {
  region = "us-east-1"
}

# AMI Image details
data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#Retriving info from remote state according to each deployment environment from network output
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "${var.env}-${local.prefix}-finalproject" // bucket to get state according to different environments
    key    = "${var.env}-Network/terraform.tfstate"
    region = "us-east-1"
  }
}


# Data source for availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

module "globalvars" {
  source = "../globalvars"
}

# Define tags locally
locals {
  default_tags = merge(module.globalvars.default_tags, { "env" = var.env })
  prefix       = module.globalvars.prefix
  name_prefix  = "${local.prefix}-${var.env}"
}