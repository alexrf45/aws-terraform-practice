aws_region = "us-east-1"

availability_zone_names = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

network = "10.0.1"

instance_type = "t2.micro"

key_name = "demo-prod"

volume_tags = {
  "Name"  = "Demo"
  "Owner" = "Demo-Prod"
}

ami = "ami-052efd3df9dad4825"

dev_vpc_cidr    = "10.0.0.0/16"
public_subnets  = "10.0.1.0/24"
private_subnets = "10.0.2.0/24"