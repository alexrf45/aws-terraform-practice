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
##security groups
output "security_group_id" {
  description = "The ID of the security group"
  value       = try(aws_security_group.terraform-ssh.id, aws_security_group.terraform-ssh.id, "")
}

output "security_group_vpc_id" {
  description = "The VPC ID"
  value       = try(aws_security_group.terraform-ssh.vpc_id, aws_security_group.terraform-ssh.vpc_id, "")
}

output "security_group_owner_id" {
  description = "The owner ID"
  value       = try(aws_security_group.terraform-ssh.owner_id, aws_security_group.terraform-ssh.owner_id, "")
}

output "security_group_name" {
  description = "The name of the security group"
  value       = try(aws_security_group.terraform-ssh.name, aws_security_group.terraform-ssh.name, "")
}

output "security_group_description" {
  description = "The description of the security group"
  value       = try(aws_security_group.terraform-ssh.description, aws_security_group.terraform-ssh.description, "")
}


output "public_ip_addr" {
  value       = aws_instance.terraform_ec2
  description = "The public IP address of the main terr instance."
}