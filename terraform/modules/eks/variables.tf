variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das subnets para o control plane (públicas)"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs das subnets privadas para os nodes"
  type        = list(string)
}

variable "node_instance_types" {
  description = "Tipos de instância dos nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Número desejado de nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Número mínimo de nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Número máximo de nodes"
  type        = number
  default     = 4
}

variable "node_disk_size" {
  description = "Tamanho do disco dos nodes (GB)"
  type        = number
  default     = 20
}

variable "ssh_key_name" {
  description = "Nome da chave SSH para os nodes"
  type        = string
  default     = null
}

variable "enable_cluster_autoscaler" {
  description = "Habilitar Cluster Autoscaler"
  type        = bool
  default     = true
}

variable "enable_container_insights" {
  description = "Habilitar CloudWatch Container Insights"
  type        = bool
  default     = true
}

variable "cluster_log_types" {
  description = "Tipos de logs do cluster a serem habilitados"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "endpoint_private_access" {
  description = "Habilitar acesso privado ao endpoint do cluster"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Habilitar acesso público ao endpoint do cluster"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDRs permitidos para acesso público ao endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "common_tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}

variable "dynamodb_table_arn" {
  description = "ARN da tabela DynamoDB para permissões do analytics service"
  type        = string
}