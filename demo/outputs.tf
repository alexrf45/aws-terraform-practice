output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.dev.id, "")
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(aws_vpc.dev.cidr_block, "")
}
output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.dev.arn, "")
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.dev-public-subnet.id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.dev-private-subnet.id
}