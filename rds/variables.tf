variable "availability_zones" {
    type                   = list(string)
    description            = "az to deploy the db"
   default                 = ["eu-south-1a", "eu-south-1b"]
}

variable "cluster_identifier" {
    type                    = string
    description             = "the identifier of the cluster"
    default                 = "my-auroral-cluster"
  
}

variable "engine_type" {
    type                   = string
    description            = "engine type"
    default                = "aurora-mysql"
  
}

variable "database_names" {
  type                 = string
  description          = "the name of the database"
  default              = "dreambig_database"
}

variable "master_username" {
  type              = string
  description       = "the name of database user for security purpose"
  default           = "auroral_user"
}

variable "engine_version" {
  type                = string
  description         = "the version for auroral engine to deploy this database"
  default             = "8.0.mysql_aurora.3.05.2"
}

variable "master_password" {
  type = string
  default = "myauroral12345"
  
}