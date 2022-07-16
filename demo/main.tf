resource "aws_vpc" "dev" {
  cidr_block           = var.dev_vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags                 = var.resource_tags
}

resource "aws_internet_gateway" "dev-IGW" { # Creating Internet Gateway
  vpc_id = aws_vpc.dev.id                   # vpc_id will be generated after we create VPC
}

resource "aws_subnet" "dev-private-subnet" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = var.private_subnets # CIDR block of private subnets
  tags       = var.resource_tags
}

resource "aws_subnet" "dev-public-subnet" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = var.public_subnets # CIDR block of public subnets
  tags       = var.resource_tags
}
# Route table for Public Subnet's
resource "aws_route_table" "dev-public-rt" { # Creating RT for Public Subnet
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0" # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.dev-IGW.id
  }
  tags = var.resource_tags
}
#Route table for Private Subnet's
resource "aws_route_table" "dev-private-rt" { # Creating RT for Private Subnet
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block     = "0.0.0.0/0" # Traffic from Private Subnet reaches Internet via NAT Gateway
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
  tags = var.resource_tags
}

#Route table Association with Public Subnet's
resource "aws_route_table_association" "dev-public-rt-association" {
  subnet_id      = aws_subnet.dev-public-subnet.id
  route_table_id = aws_route_table.dev-public-rt.id
}
#Route table Association with Private Subnet's
resource "aws_route_table_association" "dev-private-rt-association" {
  subnet_id      = aws_subnet.dev-private-subnet.id
  route_table_id = aws_route_table.dev-private-rt.id
}
resource "aws_eip" "devnatIP" {
  vpc  = true
  tags = var.resource_tags
}
#Creating the NAT Gateway using subnet_id and allocation_id
resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.devnatIP.id
  subnet_id     = aws_subnet.dev-public-subnet.id
  tags          = var.resource_tags
}