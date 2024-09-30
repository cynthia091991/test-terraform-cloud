resource "aws_eip" "bar" {
  domain = "vpc"

  instance                  = var.instance_id
  associate_with_private_ip = "10.0.0.12"
  depends_on                = [aws_internet_gateway.gw]
}