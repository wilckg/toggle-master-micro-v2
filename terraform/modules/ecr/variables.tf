variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "service_names" {
  description = "Nomes dos serviços (microsserviços)"
  type        = list(string)
  default     = ["auth", "flag", "targeting", "evaluation", "analytics"]
}

variable "image_tag_mutability" {
  description = "Mutabilidade das tags (MUTABLE ou IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "enable_scan_on_push" {
  description = "Escanear imagem ao fazer push"
  type        = bool
  default     = true
}

variable "scan_type" {
  description = "Tipo de scan (BASIC ou ENHANCED)"
  type        = string
  default     = "BASIC"
}

variable "encryption_type" {
  description = "Tipo de criptografia (AES256 ou KMS)"
  type        = string
  default     = "AES256"
}

variable "kms_key_arn" {
  description = "ARN da chave KMS (se encryption_type = KMS)"
  type        = string
  default     = null
}

variable "lifecycle_policy_count" {
  description = "Número de imagens a manter"
  type        = number
  default     = 30
}

variable "common_tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}