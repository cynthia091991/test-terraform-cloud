resource "aws_instance" "web_server" {
  ami                     = var.ami 
  instance_type           = "t2.micro"
  subnet_id               = var.test_private_sub_0
  vpc_security_group_ids  = var.vpc_security_group_ids

  tags = {
    Name = "dreambigserver"
  }
}





