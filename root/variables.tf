variable "AWS_SECRET_ACCESS_KEY" {
    type    = string
    default = ""
}

variable "AWS_ACCESS_KEY_ID" {
    type    = string
    default = ""
}

variable "instance_type" {
    default = "t3.micro" 
  
}

variable "region" {
  default = ["us-east-1"]
}

variable "ImageId " {
  default = "ami-0bcdb47863b39579f" 
}