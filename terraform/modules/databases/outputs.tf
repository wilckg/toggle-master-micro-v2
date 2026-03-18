# ------------------------------------------
# RDS ENDPOINTS
# ------------------------------------------

output "auth_endpoint" {
  description = "Endpoint do banco Auth"
  value       = aws_db_instance.auth.address
  sensitive   = true
}

output "auth_port" {
  description = "Porta do banco Auth"
  value       = aws_db_instance.auth.port
}

output "auth_db_name" {
  description = "Nome do database Auth"
  value       = aws_db_instance.auth.db_name
}

output "flag_endpoint" {
  description = "Endpoint do banco Flag"
  value       = aws_db_instance.flag.address
  sensitive   = true
}

output "targeting_endpoint" {
  description = "Endpoint do banco Targeting"
  value       = aws_db_instance.targeting.address
  sensitive   = true
}

# ------------------------------------------
# ELASTICACHE
# ------------------------------------------

output "elasticache_endpoint" {
  description = "Endpoint do Redis"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
  sensitive   = true
}

output "elasticache_port" {
  description = "Porta do Redis"
  value       = aws_elasticache_cluster.main.port
}

# ------------------------------------------
# DYNAMODB
# ------------------------------------------

output "dynamodb_table_name" {
  description = "Nome da tabela DynamoDB"
  value       = aws_dynamodb_table.analytics.name
}

output "dynamodb_table_arn" {
  description = "ARN da tabela DynamoDB"
  value       = aws_dynamodb_table.analytics.arn
}

output "dynamodb_table_id" {
  description = "ID da tabela DynamoDB"
  value       = aws_dynamodb_table.analytics.id
}

# ------------------------------------------
# SECRETS MANAGER
# ------------------------------------------

output "auth_secret_arn" {
  description = "ARN do secret Auth"
  value       = aws_secretsmanager_secret.auth_db.arn
}

output "flag_secret_arn" {
  description = "ARN do secret Flag"
  value       = aws_secretsmanager_secret.flag_db.arn
}

output "targeting_secret_arn" {
  description = "ARN do secret Targeting"
  value       = aws_secretsmanager_secret.targeting_db.arn
}

# ------------------------------------------
# SECURITY GROUPS
# ------------------------------------------

output "rds_security_group_id" {
  description = "ID do security group dos RDS"
  value       = aws_security_group.rds.id
}

output "redis_security_group_id" {
  description = "ID do security group do Redis"
  value       = aws_security_group.redis.id
}