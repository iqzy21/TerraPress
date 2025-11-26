output "aws_subnet_id" {
  description = "subnet of the vpc instance"
  value       = aws_subnet.wordpress.id
}

output "aws_security_id" {
  description = "security group of the instance"
  value       = aws_security_group.wordpress.id
}