variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
  default = ""
  
}

variable "network" {
  description = "Network subnet"
  type        = string
  default = ""
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "test-project-001-2022-07-13",
    environment = "dev"
  }
}