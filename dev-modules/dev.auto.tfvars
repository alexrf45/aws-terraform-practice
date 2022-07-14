aws_region = "us-east-1"

availability_zone_names = [
  "us-east-1d",
  "us-east-1e",
  "us-east-1f"
]

network = "10.0.2"

instance_type = "t2.micro"

key_name = "demo-dev"

volume_tags = {
  "Name"  = "Demo"
  "Owner" = "Demo-Dev"
}

dev_name = "dev-demo-subnet"

ami = "ami-052efd3df9dad4825"