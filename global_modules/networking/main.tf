# block to define the provider and region

provider "aws" {
  region = "us-east-1"
}


# block to identify availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}


# Defining the tags as local variables
locals {
  default_tags = merge(module.global_variables.default_tags, { "env" = var.env })
  prefix_all       = "${module.global_variables.prefix}-${var.env}"

}

# referencing the global variables

module "global_variables" {
  source = "../globalvars"
}

# creating a new VPC

resource "aws_vpc" "project_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(
    local.default_tags, {
      Name = "${local.prefix_all}-vpc"
    }
  )
  
}

# Add provisioning of the public subnetin the default VPC 

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_cidrs)
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = var.public_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    local.default_tags, {
      Name = "${local.prefix_all}-public-subnet-${count.index}"
    }
  )
}

# Add provisioning of the private subnetin the default VPC

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_cidrs)
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = var.private_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    local.default_tags, {
      Name = "${local.prefix_all}-private-subnet-${count.index}"
    }
  )
}
