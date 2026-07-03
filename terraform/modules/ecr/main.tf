resource "aws_ecr_repository" "this" {
  name                 = "${var.environment}-app-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}
