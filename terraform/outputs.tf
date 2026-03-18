# ==========================================
# OUTPUTS GLOBAIS DO PROJETO
# ==========================================

# ------------------------------------------
# NETWORKING
# ------------------------------------------

output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.networking.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block da VPC"
  value       = var.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value       = module.networking.private_subnet_ids
}

# ------------------------------------------
# EKS
# ------------------------------------------

output "eks_cluster_name" {
  description = "Nome do cluster EKS"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
  sensitive   = true
}

output "eks_cluster_certificate_authority_data" {
  description = "Certificado CA do cluster (base64)"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "eks_oidc_issuer_url" {
  description = "URL do OIDC Provider do EKS"
  value       = module.eks.oidc_issuer_url
}

output "eks_node_group_role_arn" {
  description = "ARN da role dos node groups"
  value       = module.eks.node_group_role_arn
}

output "eks_cluster_security_group_id" {
  description = "ID do security group do cluster EKS"
  value       = module.eks.cluster_security_group_id
}

# ------------------------------------------
# BANCOS DE DADOS
# ------------------------------------------

output "rds_auth_endpoint" {
  description = "Endpoint do RDS Auth (sem porta)"
  value       = module.databases.auth_endpoint
  sensitive   = true
}

output "rds_flag_endpoint" {
  description = "Endpoint do RDS Flag"
  value       = module.databases.flag_endpoint
  sensitive   = true
}

output "rds_targeting_endpoint" {
  description = "Endpoint do RDS Targeting"
  value       = module.databases.targeting_endpoint
  sensitive   = true
}

output "elasticache_endpoint" {
  description = "Endpoint do Redis ElastiCache"
  value       = module.databases.elasticache_endpoint
  sensitive   = true
}

output "dynamodb_table_name" {
  description = "Nome da tabela DynamoDB Analytics"
  value       = module.databases.dynamodb_table_name
}

output "dynamodb_table_arn" {
  description = "ARN da tabela DynamoDB"
  value       = module.databases.dynamodb_table_arn
}

# Secrets (referências, não valores)
output "auth_db_secret_arn" {
  description = "ARN do secret do banco Auth no Secrets Manager"
  value       = module.databases.auth_secret_arn
}

# ------------------------------------------
# MENSAGERIA
# ------------------------------------------

output "sqs_queue_url" {
  description = "URL da fila SQS"
  value       = module.sqs.queue_url
}

output "sqs_queue_arn" {
  description = "ARN da fila SQS"
  value       = module.sqs.queue_arn
}

# ------------------------------------------
# CONTAINER REGISTRY
# ------------------------------------------

output "ecr_repository_urls" {
  description = "URLs dos repositórios ECR"
  value       = module.ecr.repository_urls
}

output "ecr_repository_arns" {
  description = "ARNs dos repositórios ECR"
  value       = module.ecr.repository_arns
}

# ------------------------------------------
# COMANDOS ÚTEIS
# ------------------------------------------

output "configure_kubectl_command" {
  description = "Comando para configurar kubectl"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}

output "argocd_initial_password_command" {
  description = "Comando para obter senha inicial do ArgoCD"
  value       = "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
  sensitive   = true
}

# ------------------------------------------
# SUMÁRIO
# ------------------------------------------

output "project_summary" {
  description = "Resumo dos recursos criados"
  value = {
    project_name    = var.project_name
    environment     = var.environment
    region          = var.aws_region
    vpc_id          = module.networking.vpc_id
    cluster_name    = module.eks.cluster_name
    rds_instances   = 3
    cache_clusters  = 1
    dynamodb_tables = 1
    sqs_queues      = 1
    ecr_repos       = 5
  }
}