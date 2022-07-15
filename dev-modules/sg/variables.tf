variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "test-project-001-2022-07-13",
    environment = "dev"
  }
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = "SSH"
}