resource "aws_vpc" "main" {
  cidr_block  =  var.cidr_block 

  tags = {
    Name = var.vpc_name
  }
}
data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_sub" {
  count             = length(var.test["public_sub"])
  vpc_id            = aws_vpc.main.id 
  cidr_block        = element(var.test["public_sub"], count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags          = {
    Name        = var.subnet1_name 
  }
}


resource "aws_subnet" "private_sub" {
  count                   = length(var.test["private_sub"])
  vpc_id                  = aws_vpc.main.id 
  cidr_block              = element(var.test["private_sub"], count.index)
  map_public_ip_on_launch = false
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)

  tags      = {
    Name     = var.subnet2_name 
  }
}

