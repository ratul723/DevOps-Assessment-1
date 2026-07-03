output "registry_id" {
  description = "The AWS account ID for the ECR registry."
  value       = data.aws_caller_identity.current.account_id
}

output "repository_url" {
  description = "The URI for the ECR repository."
  value       = aws_ecr_repository.this.repository_url
}

data "aws_caller_identity" "current" {}
