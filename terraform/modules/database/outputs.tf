output "db_endpoint" {
  description = "The private database endpoint."
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "The database port."
  value       = aws_db_instance.this.port
}

output "db_username" {
  description = "The database username."
  value       = aws_db_instance.this.username
}
