variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "queue_name" {
  description = "Nome da fila (vazio para usar padrão)"
  type        = string
  default     = ""
}

variable "delay_seconds" {
  description = "Segundos de delay padrão"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Tamanho máximo da mensagem (bytes)"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Tempo de retenção das mensagens (segundos)"
  type        = number
  default     = 345600  # 4 dias
}

variable "receive_wait_time_seconds" {
  description = "Tempo de espera longo polling (segundos)"
  type        = number
  default     = 20
}

variable "visibility_timeout_seconds" {
  description = "Timeout de visibilidade (segundos)"
  type        = number
  default     = 30
}

variable "enable_dead_letter_queue" {
  description = "Habilitar DLQ"
  type        = bool
  default     = true
}

variable "max_receive_count" {
  description = "Máximo de recebimentos antes de ir para DLQ"
  type        = number
  default     = 3
}

variable "enable_fifo" {
  description = "Usar fila FIFO"
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}