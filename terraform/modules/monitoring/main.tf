resource "aws_cloudwatch_log_group" "eks" {
  name              = "/aws/eks/${var.environment}"
  retention_in_days = 30
  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_cloudwatch_log_group" "application" {
  name              = "/aws/eks/${var.environment}/application"
  retention_in_days = 30
  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_cloudwatch_metric_alarm" "node_cpu_high" {
  alarm_name          = "${var.environment}-eks-node-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EKS"
  statistic           = "Average"
  threshold           = 80
  period              = 300
  alarm_description   = "Alert when EKS node CPU is above 80%."
}
