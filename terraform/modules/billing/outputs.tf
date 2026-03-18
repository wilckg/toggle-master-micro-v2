output "budget_id" {
  description = "ID do orçamento"
  value       = aws_budgets_budget.monthly.id
}

output "budget_name" {
  description = "Nome do orçamento"
  value       = aws_budgets_budget.monthly.name
}

output "budget_limit" {
  description = "Limite do orçamento"
  value       = aws_budgets_budget.monthly.limit_amount
}