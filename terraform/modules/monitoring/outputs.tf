output "cloudwatch_log_group_names" {
  description = "List of CloudWatch log groups used for monitoring."
  value       = [aws_cloudwatch_log_group.eks.name, aws_cloudwatch_log_group.application.name]
}
