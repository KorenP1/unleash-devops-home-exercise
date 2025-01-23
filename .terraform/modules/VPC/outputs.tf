output "subnet_id" {
  description = "Outputing subnet id for ECS resource"
  value       = aws_subnet.public_subnet.id
}