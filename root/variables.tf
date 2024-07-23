variable "AWS_SECRET_ACCESS_KEY" {
    type    = string
    default = ""
}

variable "AWS_ACCESS_KEY_ID" {
    type    = string
    default = ""
}

variable "vpc_id" {
  default = "amazon-vpc"
}

variable "instance_type" {
    default = "t2.micro" 
  
}

variable "region" {
  default = ["us-east-1"]
}

variable "ImageId" {
  default = "ami-0a1debd1f3f6d1514" 
}
variable "test_private_sub_0" {
    type         = string 
    description  = "subnet id to be launching the ec2"
    default      = ""
}

# variable "public-ec2-sg" {
#     type = list(string)
#     description = "sg to launch public ec2"
#     default = ["public-ec2-sg"]

# }