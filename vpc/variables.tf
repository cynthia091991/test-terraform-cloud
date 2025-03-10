variable "cidr_block" {
    type = string
    description = "vpc cidr range"
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    type = string
    description = "vpc name"
    default = "dreambig-test-vpc"
}

variable "subnet1_name" {
    type = string
    description = "subnet name"
    default = "dreambig-pub"
}

variable "subnet2_name" {
    type = string
    description = "subnet name"
    default = "dreambig-priv"
}

variable "test" {
  type          = map(any)
  default       = {
    private_sub = ["10.0.1.0/24", "10.0.2.0/24"]
    public_sub  = ["10.0.3.0/24", "10.0.4.0/24"]
  }
}

variable "db_subnet_group_name" {
  type        = string
  default     = "dreambig-test-db"
}

locals {
  security_groups = {
    public-ec2-sg = {
      name        = "public_sg"
      description = "Security Group for Public Access"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = ["10.0.0.0/16"]           #[var.access_ip]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
 }  }
}

variable "pc_security_group_ids" {
  type = list(string)
  default = [ "" ]
}

variable "sub_db_gr" {
  type        = map(string)
  default     = {
  Environment = "dev"
  Team        = "backend"
  }
}

# variable "web_subnet" {
#   type = string
  
# }

# variable "app_subnet" {
#   type = string
  
# }
# variable "db_subnet" {
#   type = string
  
# }


# variable "create_load_balancer" {
#   type      = bool
#   default   = true
  
# }

variable "instance_id" {
  type = string
  description = "instance id for eip"
}