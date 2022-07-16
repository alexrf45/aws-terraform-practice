variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "test-project-001-2022-07-13",
    environment = "dev"
    name        = "Development"
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
