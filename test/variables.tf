variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "test-project",
    environment = "dev"
    Name        = "Development"
  }
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = "SSH"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = ""

}

variable "network" {
  description = "Network subnet"
  type        = string
  default     = "10.0.2"
}

variable "ami" {
  type    = string
  default = null

}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default = "t2-micro"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "Name of the associated ec2 key pair"
  type        = string
  default     = "dev-demo"
}

