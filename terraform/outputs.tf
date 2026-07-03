output "cluster_name" {
  description = "The EKS cluster name."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The EKS cluster endpoint."
  value       = module.eks.cluster_endpoint
}

output "registry_id" {
  description = "The ECR registry ID."
  value       = module.ecr.registry_id
}

output "registry_url" {
  description = "The ECR repository URI."
  value       = module.ecr.repository_url
}

output "vpc_id" {
  description = "The VPC ID for the cluster network."
  value       = module.network.vpc_id
}

output "private_subnet_ids" {
  description = "The private subnet IDs used for EKS worker nodes and RDS."
  value       = module.network.private_subnet_ids
}

output "log_analytics_workspace_id" {
  description = "Placeholder output for monitoring workspace ID."
  value       = "N/A"
  depends_on = []
}
