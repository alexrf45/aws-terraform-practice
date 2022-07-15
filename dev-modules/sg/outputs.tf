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