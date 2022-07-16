module "sg" {
  source = "../sg"
  
}

# module "vpc" {
#   source = "../vpc"
# }

resource "aws_key_pair" "demo_ssh_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/demo-key.pub")
}

resource "aws_instance" "terraform_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  vpc_security_group_ids      = [module.sg.security_group_id]
  user_data                   = file("docker.sh")
  tags = var.resource_tags
}
