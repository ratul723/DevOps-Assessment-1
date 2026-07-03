variable "environment" {
  type        = string
  description = "Deployment environment name."
}

variable "region" {
  type        = string
  description = "AWS region."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for public subnets."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for private subnets."
}

variable "database_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for the database subnets."
}

variable "tag_map" {
  type        = map(string)
  description = "Tags to apply to all networking resources."
  default     = {}
}
