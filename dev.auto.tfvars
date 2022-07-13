aws_region = "us-east-1"

availability_zone_names = [
  "us-east-1d",
  "us-east-1e",
  "us-east-1f"
]

network = "10.0"

instance_type = "t2.micro"

key_name = "demo-dev"

volume_tags = {
  "Name"  = "Demo"
  "Owner" = "Demo-Dev"
}

user_data = file("docker.sh")

prod_name = "pro-demo-subnet"
