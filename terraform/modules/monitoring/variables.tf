variable "environment" {
  type        = string
  description = "Deployment environment name."
}

variable "region" {
  type        = string
  description = "AWS region."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for cross-account monitoring if needed."
}

variable "tag_map" {
  type        = map(string)
  description = "Tags to apply to monitoring resources."
  default     = {}
}
