variable "ami" {
  type    = string
  default = null

}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2-micro"
}

variable "key_name" {
  description = "Name of the associated ec2 key pair"
  type        = string
  default     = "dev-demo"
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = "SSH"
}

variable "dev_vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "test-project",
    environment = "dev"
    Name        = "Development"
  }
}