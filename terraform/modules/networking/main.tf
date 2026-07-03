resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge({
    Name        = "${var.environment}-eks-vpc",
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge({
    Name        = "${var.environment}-igw",
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = merge({
    Name        = "${var.environment}-public-rt",
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_subnet" "public" {
  for_each = toset(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(data.aws_availability_zones.available.names, index(toset(var.public_subnet_cidrs), each.value))
  map_public_ip_on_launch = true
  tags = merge({
    Name        = "${var.environment}-public-${each.key}",
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  for_each = toset(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(data.aws_availability_zones.available.names, index(toset(var.private_subnet_cidrs), each.value))
  map_public_ip_on_launch = false
  tags = merge({
    Name        = "${var.environment}-private-${each.key}",
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_subnet" "database" {
  for_each = toset(var.database_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(data.aws_availability_zones.available.names, index(toset(var.database_subnet_cidrs), each.value))
  map_public_ip_on_launch = false
  tags = merge({
    Name        = "${var.environment}-db-${each.key}",
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_security_group" "eks_cluster" {
  name        = "${var.environment}-eks-cluster-sg"
  description = "EKS cluster security group"
  vpc_id      = aws_vpc.this.id
  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_security_group" "database" {
  name        = "${var.environment}-db-sg"
  description = "Database access security group"
  vpc_id      = aws_vpc.this.id
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.eks_cluster.id]
    description = "Allow EKS worker nodes to connect to the private database"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}

data "aws_availability_zones" "available" {}
