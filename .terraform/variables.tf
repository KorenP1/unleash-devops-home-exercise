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

variable "image_tag" {
  type        = string
  default     = "latest"
  description = "Image Tag"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}