variable "environment" {
  type        = string
  description = "Deployment environment name."
}

variable "region" {
  type        = string
  description = "AWS region."
}

variable "tag_map" {
  type        = map(string)
  description = "Tags to apply to ECR resources."
  default     = {}
}
