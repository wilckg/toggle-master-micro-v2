variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Lista de AZs a serem usadas (deixe vazio para usar todas disponíveis)"
  type        = list(string)
  default     = []
}

variable "public_subnet_cidrs" {
  description = "CIDRs das subnets públicas (serão calculados automaticamente se vazio)"
  type        = list(string)
  default     = []
}

variable "private_subnet_cidrs" {
  description = "CIDRs das subnets privadas"
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway (necessário para nodes privados acessarem internet)"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar apenas um NAT Gateway (mais barato, menos redundante)"
  type        = bool
  default     = true
}

variable "enable_vpc_flow_logs" {
  description = "Habilitar VPC Flow Logs para auditoria de tráfego"
  type        = bool
  default     = false
}

variable "flow_logs_retention_days" {
  description = "Dias de retenção dos flow logs"
  type        = number
  default     = 7
}

variable "common_tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}