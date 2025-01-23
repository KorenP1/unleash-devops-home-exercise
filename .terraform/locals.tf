locals {
  environment = "unleash-exercise-${var.environment}"
  bucket_name = "${var.bucket_name}-${random_string.suffix.result}"
}