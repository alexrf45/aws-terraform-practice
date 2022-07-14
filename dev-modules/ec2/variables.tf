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