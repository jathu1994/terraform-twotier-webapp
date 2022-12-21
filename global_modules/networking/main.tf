// region for
provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  default_tags = merge(var.default_tags, { "Env" = var.env })
  name_prefix  = "${var.prefix}-${var.env}"
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = merge(local.default_tags, {
    Name = "${local.name_prefix}-VPC"
    }
  )
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index + 1]

  tags = merge(local.default_tags, {
    Name = "${local.name_prefix}-PublicSubnet${count.index + 1}"
    }
  )
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index + 1]

  tags = merge(local.default_tags, {
    Name = "${local.name_prefix}-PrivateSubnet${count.index + 1}"
    }
  )
}
