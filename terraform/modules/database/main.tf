resource "aws_db_subnet_group" "this" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = merge({
    Name        = "${var.environment}-db-subnet-group",
    Environment = var.environment,
  }, var.tag_map)
}

resource "aws_db_instance" "this" {
  identifier              = "${var.environment}-db"
  engine                  = "postgres"
  engine_version          = "16.5"
  instance_class          = "db.t3.medium"
  allocated_storage       = var.db_allocated_storage
  username                = var.db_username
  password                = random_password.db_password.result
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.security_group_id]
  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = false
  tags = merge({
    Environment = var.environment,
  }, var.tag_map)
}

resource "random_password" "db_password" {
  length  = 16
  special = true
}
