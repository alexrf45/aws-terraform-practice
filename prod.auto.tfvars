aws_region = "us-east-1"

availability_zone_names = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

network = "10.0"

instance_type = "t2.micro"

key_name = "demo-prod"

volume_tags = {
  "Name"  = "Demo"
  "Owner" = "Demo-Prod"
}

user_data = file("docker.sh")