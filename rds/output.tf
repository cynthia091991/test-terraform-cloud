output "kms_secrets" {
    value = local.db_creds 
  
}

output "db_creds" {
  value = yamldecode(data.aws_kms_secrets.creds.plaintext["dbexample"])
}
