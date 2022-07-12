terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "terraform_ec2_ssh_key" {
  key_name   = "terraform_ec2"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA/NBI5Ny0d1BcaqBdVElOKmKSxL6L8wXfxo8+o2PW9X terraform demo"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.10.10.0/24"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "main"
  }
}

output "vpc_id" {
  description = "The Tagged VPC Name"
  value       = data.aws_vpc.main.id
}

resource "aws_security_group" "terraform-ssh" {
  name        = "terraform-ssh-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.vpc_id.id

  ingress {
    description = "SSH to Demo EC2 Instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "terraform_ec2" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "terraform_ec2"
  vpc_security_group_ids      = [aws_security_group.terraform-ssh.id]
  tags = {
    Name = "Terraform-Demo-001"
  }
}

