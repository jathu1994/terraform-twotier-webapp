output "vpc_id" {
  value = aws_vpc.project_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "public_cidr_blocks" {
  value = var.public_cidrs
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "private_cidr_blocks" {
  value = var.private_cidrs
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}


output "aws_eip" {
  value = aws_eip.nat_gateway_eip.id
}


output "aws_internet_gateway" {
  value = aws_internet_gateway.internet_gateway.id
}

output "public_route_table" {
  value = aws_route_table.public_table.id
}

output "private_route_table" {

  value = aws_route_table.private_table.id
}