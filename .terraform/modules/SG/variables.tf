variable "port" {
  type        = number
  default     = 3000
  description = "Allowed Ingress Port"
}

variable "vpc_id" {
  type        = string
  description = "vpc_id for SG resource"
}

variable "cidr_block" {
  type        = string
  description = "cidr_block for ingress rule"
}