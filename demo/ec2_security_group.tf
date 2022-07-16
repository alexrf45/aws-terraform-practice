resource "aws_security_group" "terraform-ssh" {
  name        = "terraform-ssh-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.dev.id

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