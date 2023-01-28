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
  subnet_id                   = aws_subnet.dev-public-subnet.id
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp2"
    encrypted   = true
     }
  metadata_options {
	  http_endpoint = "enabled"
    http_tokens = "required"
    }
  user_data                   = file("docker.sh")
  tags                        = var.resource_tags
}
