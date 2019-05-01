data "aws_secretsmanager_secret" "rds-password" {
  name = "rds-password"
}

data "aws_secretsmanager_secret_version" "latest-password" {
  secret_id = "${data.aws_secretsmanager_secret.rds-password.id}"
}

resource "aws_rds_cluster" "db" {
  cluster_identifier = "rds-db-cluster"
  engine = "aurora-mysql"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name = "test"
  master_username = "root"
  master_password = "${data.aws_secretsmanager_secret_version.latest-password.secret_string}"
}

output "password" {
  value = "${aws_rds_cluster.db.master_password}"
}
