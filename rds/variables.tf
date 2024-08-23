variable "availability_zones" {
    type                   = list(string)
    description            = "az to deploy the db"
   default                 = ["eu-south-1a", "eu-south-1b", "eu-south-1c"]
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
  default           = "value"
}
