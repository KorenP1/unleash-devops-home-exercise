output "iam_arn" {
  description = "IAM arn for task definition"
  value       = aws_iam_role.main.arn
}