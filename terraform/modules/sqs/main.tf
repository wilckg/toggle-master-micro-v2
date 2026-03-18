resource "aws_sqs_queue" "main" {
  name                       = "${var.project_name}-queue"
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  
  redrive_policy = var.enable_dead_letter_queue ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  }) : null

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-queue"
  })
}

resource "aws_sqs_queue" "dlq" {
  count = var.enable_dead_letter_queue ? 1 : 0
  
  name                       = "${var.project_name}-dlq"
  message_retention_seconds  = 1209600  # 14 dias
  visibility_timeout_seconds = var.visibility_timeout_seconds
  
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-dlq"
  })
}