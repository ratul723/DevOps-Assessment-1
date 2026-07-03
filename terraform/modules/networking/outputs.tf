output "vpc_id" {
  description = "The VPC ID."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "database_subnet_ids" {
  description = "Database subnet IDs."
  value       = [for subnet in aws_subnet.database : subnet.id]
}

output "eks_cluster_sg_id" {
  description = "EKS cluster security group ID."
  value       = aws_security_group.eks_cluster.id
}

output "database_sg_id" {
  description = "Database security group ID."
  value       = aws_security_group.database.id
}
