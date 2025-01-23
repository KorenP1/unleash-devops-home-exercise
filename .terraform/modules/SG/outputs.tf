output "security_group_id" {
  description = "Exporting SG id for ECS resource"
  value       = aws_security_group.main.id
}