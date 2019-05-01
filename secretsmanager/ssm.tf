resource "aws_secretsmanager_secret" "rds-password" {
  name = "rds-password"
}

resource "aws_secretsmanager_secret_version" "rds-password" {
  secret_id = "${aws_secretsmanager_secret.rds-password.id}"
  secret_string = "MySecureRDSPassword"
}

