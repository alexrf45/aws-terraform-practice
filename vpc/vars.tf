variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "test-project",
    environment = "dev"
    Name        = "Development"
  }
}
variable "dev_vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}