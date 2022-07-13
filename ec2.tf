resource "aws_key_pair" "demo_ssh_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/demo-key.pub")
}

resource "aws_instance" "terraform_ec2" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = var.instance_type
  instance_count              = var.instance_count
  associate_public_ip_address = "true"
  key_name                    = "terraform_ec2"
  vpc_security_group_ids      = data.aws_vpc.main.id
  user_data                   = file("docker.sh")
  tags = {
    Name = "Terraform-Demo-EC2"
  }
}

