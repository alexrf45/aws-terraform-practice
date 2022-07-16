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
  tags       = var.resource_tags
}

resource "aws_security_group" "terraform-ssh" {
  name        = "terraform-ssh-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = var.description
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.resource_tags
}

resource "aws_key_pair" "demo_ssh_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/demo-key.pub")
}

resource "aws_instance" "terraform_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  vpc_security_group_ids      = aws_security_group.terraform-ssh.id
  subnet_id                   = aws_subnet.dev-subnet.id
  user_data                   = file("docker.sh")
  tags                        = var.resource_tags
}