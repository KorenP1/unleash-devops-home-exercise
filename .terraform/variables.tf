variable "environment" {
  type        = string
  default     = "test"
  description = "Short environment name"
}

variable "bucket_name" {
  type        = string
  default     = "my-test-bucket"
  description = "S3 Bucket Name"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}