variable "environment" {
  description = "Deployment environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Kubernetes cluster name."
  type        = string
  default     = "devops-assessment-eks"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version."
  type        = string
  default     = "1.28"
}

variable "node_group_name" {
  description = "EKS managed node group name."
  type        = string
  default     = "worker-group"
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes."
  type        = string
  default     = "t3.medium"
}

variable "node_count" {
  description = "Number of worker nodes in the managed node group."
  type        = number
  default     = 2
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnet_cidrs" {
  description = "CIDR blocks for the database subnets."
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "db_username" {
  description = "Database username for the private database."
  type        = string
  default     = "dbadmin"
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB for the RDS database."
  type        = number
  default     = 20
}

variable "state_bucket" {
  description = "S3 bucket name for remote Terraform state."
  type        = string
  default     = "devops-assessment-terraform-state"
}

variable "state_lock_table" {
  description = "DynamoDB table for Terraform state locking."
  type        = string
  default     = "devops-terraform-locks"
}

variable "tag_map" {
  description = "Additional tags to apply to AWS resources."
  type        = map(string)
  default     = {}
}
