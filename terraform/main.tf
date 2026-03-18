terraform {
  required_version = ">= 1.5.0"
}

# ==========================================
# MÓDULOS
# ==========================================

module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  aws_region   = var.aws_region
}

module "databases" {
  source                = "./modules/databases"
  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  vpc_cidr              = module.networking.vpc_cidr_block
  private_subnet_ids    = module.networking.private_subnet_ids
  # eks_security_group_id = module.eks.cluster_security_group_id
  
  depends_on = [module.networking]
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = "${var.project_name}-cluster"
  vpc_id             = module.networking.vpc_id
  vpc_cidr           = var.vpc_cidr
  subnet_ids         = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  dynamodb_table_arn = module.databases.dynamodb_table_arn

  depends_on = [module.networking, module.databases]
}

resource "aws_security_group_rule" "eks_to_rds" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = module.eks.cluster_security_group_id
  security_group_id        = module.databases.rds_security_group_id
  
  depends_on = [module.eks, module.databases]
}

module "sqs" {
  source       = "./modules/sqs"
  project_name = var.project_name
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "billing" {
  source      = "./modules/billing"
  project_name = var.project_name
  alert_email = var.alert_email
}