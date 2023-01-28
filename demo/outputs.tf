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

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = aws_instance.terraform_ec2.public_ip
}

output "id" {
  description = "The ID of the instance"
  value       = aws_instance.terraform_ec2.id
}

output "repo-url" {
  description = "The url of the repo"
	value = aws_ecr_repository.web-image-repo.repository_url
}

output "repo-id" {
  description = "The id of the repo"
	value       = aws_ecr_repository.web-image-repo.registry_id
}
