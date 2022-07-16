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