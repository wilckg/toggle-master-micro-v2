# Subnet Group para RDS
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

# Security Group para RDS
resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "Security group for RDS PostgreSQL"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-rds-sg"
  })
}

# 3 Instâncias RDS PostgreSQL (uma para cada microsserviço)
resource "aws_db_instance" "auth" {
  identifier        = "${var.project_name}-auth-db"
  engine           = "postgres"
  engine_version   = var.db_engine_version
  instance_class   = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  
  db_name  = "authdb"
  username = "auth_admin"
  password = random_password.auth_db_password.result  # ← Referência direta, não via secret_version
  
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  
  backup_retention_period = var.db_backup_retention_period
  deletion_protection     = var.db_deletion_protection
  skip_final_snapshot     = var.db_skip_final_snapshot
  multi_az               = var.db_multi_az
  
  tags = merge(local.common_tags, {
    Name = "${var.project_name}-auth-db"
    Service = "auth"
  })
}

resource "aws_db_instance" "flag" {
  identifier        = "${var.project_name}-flag-db"
  engine           = "postgres"
  engine_version   = var.db_engine_version
  instance_class   = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  
  db_name  = "flagdb"
  username = "flag_admin"
  password = random_password.flag_db_password.result  # ← Referência direta, não via secret_version
  
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  
  backup_retention_period = var.db_backup_retention_period
  deletion_protection     = var.db_deletion_protection
  skip_final_snapshot     = var.db_skip_final_snapshot
  multi_az               = var.db_multi_az
  
  tags = merge(local.common_tags, {
    Name = "${var.project_name}-flag-db"
    Service = "flag"
  })
}

resource "aws_db_instance" "targeting" {
  identifier        = "${var.project_name}-targeting-db"
  engine           = "postgres"
  engine_version   = var.db_engine_version
  instance_class   = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  
  db_name  = "targetingdb"
  username = "targeting_admin"
  password = random_password.targeting_db_password.result  # ← Referência direta, não via secret_version
  
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  
  backup_retention_period = var.db_backup_retention_period
  deletion_protection     = var.db_deletion_protection
  skip_final_snapshot     = var.db_skip_final_snapshot
  multi_az               = var.db_multi_az
  
  tags = merge(local.common_tags, {
    Name = "${var.project_name}-targeting-db"
    Service = "targeting"
  })
}

# ElastiCache Redis
resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.project_name}-cache-subnet"
  subnet_ids = var.private_subnet_ids
}

resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.project_name}-cache"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379
  security_group_ids   = [aws_security_group.redis.id]
  subnet_group_name    = aws_elasticache_subnet_group.main.name
}

# DynamoDB para Analytics
resource "aws_dynamodb_table" "analytics" {
  name           = "ToggleMasterAnalytics"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "ToggleMasterAnalytics"
  }
}