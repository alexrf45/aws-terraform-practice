variable "aws_region" {
  description = "AWS Region for dev"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
    type = string
    default = null
  
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "Name of the associated ec2 key pair"
  type = string
  default = null  
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "test-project-001-2022-07-13",
    environment = "dev"
  }
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  
}

variable "aws_security_group" {
  type = string
  default = ""
  
}

variable "aws_vpc" {
  description = "vpc ID"
  default = ""
}