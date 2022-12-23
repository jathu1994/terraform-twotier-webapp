
# Output variables for Public Subnets
output "public_subnet_ids" {
  value = module.network-dev.public_subnet_ids
}

# Output variables for VPC 
output "vpc_id" {
  value = module.network-dev.vpc_id
}
# Output variables for Private VPC
output "private_subnet_ids" {
  value = module.network-dev.private_subnet_ids
}


# Output variables for Internet Gateway
output "aws_internet_gateway" {
  value = module.network-dev.aws_internet_gateway
}

# Output variables for Elastic IP

output "aws_eip" {
  value = module.network-dev.aws_eip
}

# Output variables for Private Route

output "private_route_table" {
  value = module.network-dev.private_route_table
}

# Output variables for Public Route Table

output "public_route_table" {
  value = module.network-dev.public_route_table
}

# Output variables for Public Cidr Block
output "public_cidr_blocks" {
  value = module.network-dev.public_cidr_blocks
}

# Output variables for Private CIDR block 
output "private_cidr_blocks" {
  value = module.network-dev.private_cidr_blocks
}


