variable "name" {
  type        = string
  description = "Resource Name"
}

variable "cpu" {
  type        = number
  default     = "256"
  description = "Container CPU Capacity"
}

variable "memory" {
  type        = number
  default     = "512"
  description = "Container Memory Capacity"
}

variable "image" {
  type        = string
  default     = "docker.io/korenp/unleash-exercise"
  description = "Container Image"
}

variable "port" {
  type        = number
  default     = 3000
  description = "Container Port"
}

variable "replicas" {
  type        = number
  default     = 1
  description = "Container Count"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "security_group_id" {
  type        = string
  description = "Security Group ID"
}

variable "bucket_name" {
  type        = string
  default     = "my-test-bucket"
  description = "S3 Bucket Name"
}

variable "iam_arn" {
  type        = string
  description = "IAM role arn to connect to the task definition"
}