resource "aws_launch_template" "demo-launch-template" {
  name_prefix   = "demo-auto-scaling-group"
	image_id      = var.ami
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "demo-autoscaling" {
  #availability_zones  = ["us-east-1a"]
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = [aws_subnet.dev-public-subnet.id]
  launch_template {
    id      = aws_launch_template.demo-launch-template.id
    version = "$Latest"
  }
	instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}
