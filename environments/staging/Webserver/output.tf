output "public_subnet_ids" {
  value = module.network-prod.public_subnet_ids
}

output "vpc_id" {
  value = module.network-prod.vpc_id
}

output "private_subnet_ids" {
  value = module.network-prod.private_subnet_ids
}

output "aws_internet_gateway" {
  value = module.network-prod.aws_internet_gateway
}

output "aws_eip" {
  value = module.network-prod.aws_eip
}

output "private_route_table" {
  value = module.network-prod.private_route_table
}

output "public_route_table" {
  value = module.network-prod.public_route_table
}

output "public_cidr_blocks" {
  value = module.network-prod.public_cidr_blocks
}

output "private_cidr_blocks" {
  value = module.network-prod.private_cidr_blocks
}


