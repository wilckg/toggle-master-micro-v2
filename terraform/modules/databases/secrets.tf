resource "random_password" "auth_db_password" {
  length           = 32
  special          = false
}

resource "random_password" "flag_db_password" {
  length           = 32
  special          = false
}

resource "random_password" "targeting_db_password" {
  length           = 32
  special          = false
}

resource "aws_secretsmanager_secret" "auth_db" {
  name                    = "${var.project_name}/auth-db-credentials"
  description             = "Credentials for Auth Service Database"
  recovery_window_in_days = 7
  tags                    = local.common_tags
}

resource "aws_secretsmanager_secret_version" "auth_db" {
  secret_id = aws_secretsmanager_secret.auth_db.id
  secret_string = jsonencode({
    username = "auth_admin"
    password = random_password.auth_db_password.result
    engine   = "postgres"
  })
}

resource "aws_secretsmanager_secret" "flag_db" {
  name                    = "${var.project_name}/flag-db-credentials"
  description             = "Credentials for Flag Service Database"
  recovery_window_in_days = 7
  tags                    = local.common_tags
}

resource "aws_secretsmanager_secret_version" "flag_db" {
  secret_id = aws_secretsmanager_secret.flag_db.id
  secret_string = jsonencode({
    username = "flag_admin"
    password = random_password.flag_db_password.result
    engine   = "postgres"
  })
}

resource "aws_secretsmanager_secret" "targeting_db" {
  name                    = "${var.project_name}/targeting-db-credentials"
  description             = "Credentials for Targeting Service Database"
  recovery_window_in_days = 7
  tags                    = local.common_tags
}

resource "aws_secretsmanager_secret_version" "targeting_db" {
  secret_id = aws_secretsmanager_secret.targeting_db.id
  secret_string = jsonencode({
    username = "targeting_admin"
    password = random_password.targeting_db_password.result
    engine   = "postgres"
  })
}
