module "dev" {
  source          = "../vpc"
  dev_vpc_cidr    = module.dev.cidr_block
  private_subnets = module.dev.public_subnet.id
  public_subnets  = module.dev.private_subnet.id
}

resource "aws_security_group" "terraform-ssh" {
  name        = "terraform-ssh-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.dev.id

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
  vpc_security_group_ids      = [aws_security_group.terraform-ssh.id]
  subnet_id                   = aws_subnet.dev-public-subnet
  user_data                   = file("docker.sh")
  tags                        = var.resource_tags
}