output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.main.name
}

output "cluster_arn" {
  description = "ARN do cluster EKS"
  value       = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "Endpoint do cluster"
  value       = aws_eks_cluster.main.endpoint
  sensitive   = true
}

output "cluster_certificate_authority_data" {
  description = "Dados do certificado CA do cluster (base64)"
  value       = aws_eks_cluster.main.certificate_authority[0].data
  sensitive   = true
}

output "cluster_security_group_id" {
  description = "ID do security group do cluster"
  value       = aws_security_group.eks_cluster.id
}

output "cluster_iam_role_name" {
  description = "Nome da IAM role do cluster"
  value       = aws_iam_role.eks_cluster.name
}

output "cluster_iam_role_arn" {
  description = "ARN da IAM role do cluster"
  value       = aws_iam_role.eks_cluster.arn
}

output "oidc_provider_arn" {
  description = "ARN do OIDC Provider"
  value       = aws_iam_openid_connect_provider.eks.arn
}

output "oidc_issuer_url" {
  description = "URL do issuer OIDC"
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "node_group_name" {
  description = "Nome do node group"
  value = aws_eks_node_group.main.node_group_name
}

output "node_group_arn" {
  description = "ARN do node group"
  value       = aws_eks_node_group.main.arn
}

output "node_group_role_name" {
  description = "Nome da role dos nodes"
  value       = aws_iam_role.eks_node_group.name
}

output "node_group_role_arn" {
  description = "ARN da role dos nodes"
  value       = aws_iam_role.eks_node_group.arn
}

output "analytics_service_role_arn" {
  description = "ARN da role para o serviço analytics (DynamoDB access)"
  value       = aws_iam_role.analytics_service_role.arn
}

output "cluster_primary_security_group_id" {
  description = "ID do security group primário do cluster"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}