output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.main.id, "")
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.main.arn, "")
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(aws_vpc.main.cidr_block, "")
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = try(aws_vpc.main.default_security_group_id, "")
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = try(aws_subnet.dev-subnet.id, "")
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = try(aws_subnet.dev-subnet.arn, "")
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = compact(aws_subnet.dev-subnet[*].cidr_block)
}