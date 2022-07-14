output "private_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."
}

output "public_ip_addr" {
  value       = aws_instance.server.public_ip
  description = "The public IP address of the main server instance."
}

output "instance_id" {
  description = "AWS ID for the EC2 instance used"
  value       = "${aws_instance.server.id}"
}

output "availability_zone" {
  description = "AWS Availability Zone in which the EC2 instance was created"
  value       = "${local.availability_zone}"
}