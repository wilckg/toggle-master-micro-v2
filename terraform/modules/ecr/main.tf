# Criar 5 repositórios ECR (um para cada microsserviço)
locals {
  services = ["auth", "flag", "targeting", "evaluation", "analytics"]
}

resource "aws_ecr_repository" "services" {
  count = length(local.services)
  
  name                 = "togglemaster-${local.services[count.index]}"
  image_tag_mutability = "MUTABLE"
  
  image_scanning_configuration {
    scan_on_push = true
  }
  
  tags = {
    Name = "togglemaster-${local.services[count.index]}"
  }
}