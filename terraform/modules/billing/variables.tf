variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "budget_amount" {
  description = "Valor limite do orçamento (USD)"
  type        = number
  default     = 100
}

variable "alert_email" {
  description = "Email para alertas"
  type        = string
}

variable "threshold_actual" {
  description = "Percentual para alerta de gasto real"
  type        = number
  default     = 80
}

variable "threshold_forecasted" {
  description = "Percentual para alerta de previsão"
  type        = number
  default     = 100
}

variable "common_tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}