variable "ImageId" {
    type = string
    description = "ami id"
    default = "ami-0bcdb47863b39579f" 
}

variable "instance_type" {
    type = string
    description = "ec2 type"
    default = "t3.micro"
}

variable "instance_name" {
    type = string
    description = "ec2 name"
    default = "amazon-instance"
}

variable "subnet_id" {
    type = string
    description = "subnet id to be launching the ec2"
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