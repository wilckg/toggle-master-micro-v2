output "queue_id" {
  description = "ID da fila SQS"
  value       = aws_sqs_queue.main.id
}

output "queue_arn" {
  description = "ARN da fila SQS"
  value       = aws_sqs_queue.main.arn
}

output "queue_url" {
  description = "URL da fila SQS"
  value       = aws_sqs_queue.main.url
}

output "queue_name" {
  description = "Nome da fila"
  value       = aws_sqs_queue.main.name
}

output "dlq_arn" {
  description = "ARN da DLQ (se habilitada)"
  value       = var.enable_dead_letter_queue ? aws_sqs_queue.dlq[0].arn : null
}

output "dlq_url" {
  description = "URL da DLQ"
  value       = var.enable_dead_letter_queue ? aws_sqs_queue.dlq[0].url : null
}