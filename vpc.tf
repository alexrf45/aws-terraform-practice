resource "aws_vpc" "main" {
  cidr_block           = "${var.network}.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "demo-subnet-prod" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.prod_name}"
  }
}

resource "aws_subnet" "demo-subnet-dev" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${var.dev_name}"
  }
}