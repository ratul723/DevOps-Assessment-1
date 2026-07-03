resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = var.security_group_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  version = var.kubernetes_version

  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.node_count
    max_size     = var.node_count
    min_size     = 1
  }

  instance_types = [var.node_instance_type]

  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}
