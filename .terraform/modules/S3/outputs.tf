output "bucket_domain_name" {
  description = "Bucket URL"
  value       = aws_s3_bucket.main.bucket_domain_name
}

output "bucket_arn" {
  description = "Exporting Bucket ARN to ECS"
  value       = aws_s3_bucket.main.arn
}