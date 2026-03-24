# ==========================================
# VARIÁVEIS GLOBAIS DO PROJETO
# ==========================================

variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto (usado em todos os recursos)"
  type        = string
  default     = "togglemaster"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "O nome do projeto deve conter apenas letras minúsculas, números e hífens."
  }
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O ambiente deve ser dev, staging ou prod."
  }
}

variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "alert_email" {
  description = "Email para alertas de billing e notificações"
  type        = string
  default     = "wilck.oliveira16@gmail.com"
}

variable "ssh_key_name" {
  description = "Nome da chave SSH para acesso aos nodes EKS (opcional)"
  type        = string
  default     = null
}

variable "enable_monitoring" {
  description = "Habilitar monitoramento avançado (CloudWatch, Container Insights)"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Tags comuns aplicadas a todos os recursos"
  type        = map(string)
  default = {
    Project   = "ToggleMaster"
    ManagedBy = "Terraform"
    Owner     = "DevOps-Team"
  }
}