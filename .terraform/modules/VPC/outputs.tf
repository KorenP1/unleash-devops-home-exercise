output "subnet_id" {
  description = "Exporting subnet id for ECS resource"
  value       = aws_subnet.public_subnet.id
}

output "vpc_id" {
  description = "Exporting vpc_id for SG resource"
  value       = aws_vpc.main.id
}

output "cidr_block" {
  description = "Exporting cidr_block for SG resource"
  value       = aws_vpc.main.cidr_block
}