resource "aws_instance" "web_server" {
  ami                     = var.ami 
  instance_type           = "t3.micro"
  subnet_id               = var.test_private_sub_0
  security_groups         = var.sg-ids

  tags = {
    Name = "${var.instance_name}-${format("%03d", 1)}"
    env   = "${upper("prod")}-${upper(var.instance_name)}-${format("%03d", 1)}"
  }
lifecycle {
    create_before_destroy = true
  }

}






