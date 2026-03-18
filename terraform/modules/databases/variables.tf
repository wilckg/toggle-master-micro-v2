variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs das subnets privadas"
  type        = list(string)
}

variable "db_instance_class" {
  description = "Classe das instâncias RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "Versão do PostgreSQL"
  type        = string
  default     = "14.20"
}

variable "db_allocated_storage" {
  description = "Storage alocado (GB)"
  type        = number
  default     = 20
}

variable "db_max_allocated_storage" {
  description = "Storage máximo para autoscaling (GB)"
  type        = number
  default     = 100
}

variable "db_multi_az" {
  description = "Habilitar Multi-AZ (alta disponibilidade)"
  type        = bool
  default     = false
}

variable "db_backup_retention_period" {
  description = "Dias de retenção de backup"
  type        = number
  default     = 7
}

variable "db_deletion_protection" {
  description = "Proteção contra deleção"
  type        = bool
  default     = false  # Mude para true em produção!
}

variable "db_skip_final_snapshot" {
  description = "Pular snapshot final ao destruir"
  type        = bool
  default     = true   # Mude para false em produção!
}

variable "cache_node_type" {
  description = "Tipo do nó ElastiCache"
  type        = string
  default     = "cache.t3.micro"
}

variable "cache_engine_version" {
  description = "Versão do Redis"
  type        = string
  default     = "7.0"
}

variable "dynamodb_billing_mode" {
  description = "Modo de cobrança do DynamoDB"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "enable_performance_insights" {
  description = "Habilitar Performance Insights"
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}