
# Output variables for Public Subnets
output "public_subnet_ids" {
  value = module.network-staging.public_subnet_ids
}

# Output variables for VPC 
output "vpc_id" {
  value = module.network-staging.vpc_id
}
# Output variables for Private VPC
output "private_subnet_ids" {
  value = module.network-staging.private_subnet_ids
}


# Output variables for Internet Gateway
output "aws_internet_gateway" {
  value = module.network-staging.aws_internet_gateway
}

# Output variables for Elastic IP

output "aws_eip" {
  value = module.network-staging.aws_eip
}

# Output variables for Private Route

output "private_route_table" {
  value = module.network-staging.private_route_table
}

# Output variables for Public Route Table

output "public_route_table" {
  value = module.network-staging.public_route_table
}

# Output variables for Public Cidr Block
output "public_cidr_blocks" {
  value = module.network-staging.public_cidr_blocks
}

# Output variables for Private CIDR block 
output "private_cidr_blocks" {
  value = module.network-staging.private_cidr_blocks
}


