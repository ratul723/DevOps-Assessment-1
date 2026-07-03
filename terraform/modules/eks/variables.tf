variable "environment" {
  type        = string
  description = "Deployment environment name."
}

variable "region" {
  type        = string
  description = "AWS region for resources in this module."
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for EKS."
}

variable "node_group_name" {
  type        = string
  description = "EKS managed node group name."
}

variable "node_instance_type" {
  type        = string
  description = "EC2 instance type for worker nodes."
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the managed node group."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the EKS cluster."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for EKS worker nodes."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs for the EKS cluster."
}

variable "eks_role_arn" {
  type        = string
  description = "IAM role ARN for EKS cluster."
}

variable "node_role_arn" {
  type        = string
  description = "IAM role ARN for EKS worker nodes."
}

variable "tag_map" {
  type        = map(string)
  description = "Tags to apply to EKS resources."
  default     = {}
}
