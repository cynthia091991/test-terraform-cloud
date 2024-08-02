variable "ami" {
    type = string
    description = "ami id"
    default = "" 
}

variable "instance_type" {
    type = string
    description = "ec2 type"
    default = ""
}

variable "instance_name" {
    type = string
    description = "ec2 name"
    default = "terrraform-cloud-testing"
}

variable "test_private_sub_0" {
    type           = string
    description    = "subnet id to be launching the ec2"
    default        =  "" 
}
variable "region" {
  default = [""]
}

variable "AWS_SECRET_ACCESS_KEY" {
    type    = string
    default = ""
}

variable "AWS_ACCESS_KEY_ID" {
    type    = string
    default = ""
}
variable "vpc_id" {
  default = ""
}

variable "vpc_security_group_ids" {
    type = list(string)
    description = "sg to launch public ec2"
    default = [""]

}
