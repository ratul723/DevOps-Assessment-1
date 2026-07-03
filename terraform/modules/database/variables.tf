variable "environment" {
  type        = string
  description = "Deployment environment name."
}

variable "region" {
  type        = string
  description = "AWS region."
}

variable "db_username" {
  type        = string
  description = "Database username."
}

variable "db_allocated_storage" {
  type        = number
  description = "Storage size for the RDS database."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the database."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the database subnets."
}

variable "security_group_id" {
  type        = string
  description = "Security group ID for the database access."
}

variable "tag_map" {
  type        = map(string)
  description = "Tags to apply to database resources."
  default     = {}
}
