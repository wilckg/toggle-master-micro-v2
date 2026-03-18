output "repository_names" {
  description = "Nomes dos repositórios"
  value       = [for repo in aws_ecr_repository.services : repo.name]
}

output "repository_urls" {
  description = "URLs dos repositórios"
  value       = { for idx, repo in aws_ecr_repository.services : var.service_names[idx] => repo.repository_url }
}

output "repository_arns" {
  description = "ARNs dos repositórios"
  value       = [for repo in aws_ecr_repository.services : repo.arn]
}

output "repository_registry_id" {
  description = "ID do registry"
  value       = length(aws_ecr_repository.services) > 0 ? aws_ecr_repository.services[0].registry_id : null
}