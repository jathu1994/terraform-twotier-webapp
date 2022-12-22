# code block for creation of NAT Gateway with tags for private subnets 
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnets[1].id

  tags = merge(
    local.default_tags, {
      Name = "${local.prefix_all}-nat_gateway"
    }
  )


}


# code block for creation of Elastic ip block with tags for NAT Gateway
resource "aws_eip" "nat_gateway_eip" {
  vpc   = true
  tags = {
    Name = "${local.prefix_all}-nat_gateway_eip"
  }
depends_on = [aws_internet_gateway.internet_gateway]
}

# code block for creation of Internet Gateway with tags 
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.project_vpc.id

  tags = merge(local.default_tags,
    {
      "Name" = "${local.prefix_all}-internet_gateway"
    }
  )
}



# route table creation code block group

# code block for creation of Private Route Table with tags for routing default gateway  to Internet Gateway
resource "aws_route_table" "private_table" {
  vpc_id = aws_vpc.project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
   tags = merge(
    local.default_tags, {
      Name = "${local.prefix_all}-private_table"
    }
  )
}

# code block for creation of Public Route Table with tags for routing default gateway  to Internet Gateway)
resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "${local.prefix_all}-public_table"
  }
}



# route table association code block group

# code block to associate all the public subnets to publi route table
resource "aws_route_table_association" "public_table_association" {
  count          = length(aws_subnet.public_subnets[*].id)
  route_table_id = aws_route_table.public_table.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

# Associate subnets with the  Private route table
resource "aws_route_table_association" "private_table_association" {
  count          = length(aws_subnet.private_subnets[*].id)
  route_table_id = aws_route_table.private_table.id
  subnet_id      = aws_subnet.private_subnets[count.index].id
}