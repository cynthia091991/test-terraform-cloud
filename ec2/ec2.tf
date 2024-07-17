resource "aws_instance" "web-server" {
  ami = var.ImageId
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = {
    Name = var.instance_name
  }
}