resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine_type
  engine_version          = var.engine_version
  availability_zones      = var.availability_zones
  database_name           = var.database_names
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  

  final_snapshot_identifier   = "example-cluster-final-snapshot"


#  lifecycle {
#     create_before_destroy = false
#   }

}