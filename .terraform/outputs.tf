output "bucket_domain_name" {
  description = "Bucket URL"
  value       = module.S3.output.bucket_domain_name
}