data "aws_kms_secrets" "creds" {
 secret {
   name    = "dbexample"
   payload = file("${path.module}/creds.yml.encrypted")
 }
}

locals {
 db_creds = yamldecode(data.aws_kms_secrets.creds.plaintext["dbexample"])
}

resource "aws_rds_cluster" "dreambig_database" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine_type
  engine_version          = var.engine_version
  availability_zones      = var.availability_zones
  storage_encrypted       = true  
  db_subnet_group_name    = var.db-subnet-group
  kms_key_id              = data.aws_kms_key.by_id.arn
  database_name           = var.database_names
  master_username         = local.db_creds.username
  master_password         = local.db_creds.password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  
  

  final_snapshot_identifier   = "cluster-final-snapshot"

 lifecycle {
    create_before_destroy = true
  }
}

 data "aws_kms_key" "by_id" {
  key_id = "arn:aws:kms:eu-south-1:244164702239:key/56079357-3f8b-4b41-a0b1-83dabd907f78"
}


