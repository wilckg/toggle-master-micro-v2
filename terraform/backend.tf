terraform {
  backend "s3" {
    bucket       = "togglemaster-wilck-terraform-state"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # Para lock do estado
  }
}