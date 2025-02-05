output "environment" {
  description = "Full Environment Name"
  value       = local.environment
}

output "bucket_domain_name" {
  description = "Bucket URL"
  value       = module.S3.bucket_domain_name
}