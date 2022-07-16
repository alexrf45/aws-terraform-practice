output "private_ip_addr" {
  value       = aws_instance.terraform_ec2
  description = "The private IP address of the main terr instance."
}

output "public_ip_addr" {
  value       = aws_instance.terraform_ec2
  description = "The public IP address of the main terr instance."
}

output "instance_id" {
  description = "AWS ID for the EC2 instance used"
  value       = aws_instance.terraform_ec2.id
}
