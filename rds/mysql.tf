resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine_type
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = var.availability_zones
  database_name           = var.database_names
  master_username         = ""
  master_password         = "must_be_eight_characters"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}