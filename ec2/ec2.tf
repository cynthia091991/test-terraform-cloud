data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name    = "virtualization-type"
    values  = ["hvm"]
  }

  owners     =  ["099720109477"] # Canonical
}

resource "aws_instance" "web-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id           = var.test_private_sub_0


  tags = {
    Name = "dreambig-server"
  }
}

# variable "MWName" {
#   type = map(any)
#   default = {
#     dev = ["itops-dv", "dev-reboot"]
#     uat = ["itops-ut", "uat-reboot"]
#   }
# }
# variable "MWName" {
#   type = map(list(string))
# )
# ...



# output "MWName" {
#   value = var.MWName
# }
# output "MWName_dev" {
#   value = var.MWName["dev"]
# }
# output "MWName_dev_0" {
#   value = var.MWName["dev"][0]
# }
# output "MWName_dev_1" {
#   value = var.MWName["dev"][1]
# }