resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = var.resource_tags
  }


resource "aws_subnet" "dev-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.network}.0/24"
  map_customer_owned_ip_on_launch = "true"
  tags = var.resource_tags
  }
