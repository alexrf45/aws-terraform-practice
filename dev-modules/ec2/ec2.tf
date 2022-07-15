module "vpc_security_group" {
  source = "../vpc"
  
}

resource "aws_key_pair" "demo_ssh_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/demo-key.pub")
}

resource "aws_instance" "terraform_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = "true"
  key_name                    = "terraform_ec2"
  vpc_security_group_ids      = [aws_security_group.terraform-ssh.id]
  user_data                   = file("docker.sh")
  tags = var.resource_tags
}

