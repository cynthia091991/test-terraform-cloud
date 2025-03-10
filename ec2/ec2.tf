resource "aws_instance" "web_server" {
  ami                     = var.ami 
  instance_type           = "t3.micro"
  subnet_id               = var.test_private_sub_0
  security_groups         = var.sg-ids
  key_name = "tfserverkey"
  tags = {
    Name = "${var.instance_name}-${format("%03d", 1)}"
    env   = "${upper("prod")}-${upper(var.instance_name)}-${format("%03d", 1)}"
  }
lifecycle {
    create_before_destroy = true
  }
user_data = <<-EOF
             #!/bin/bash
             sudo apt-get update
             sudo apt-get install -y nginx
             sudo systemctl start nginx
             sudo systemctl enable nginx
             echo '<!doctype html>
             <html lang="en"><h1>Home page!</h1></br>
             <h3>(Instance A)</h3>
             </html>' | sudo tee /var/www/html/index.html
             EOF
}


resource "aws_instance" "instance_b" { //Instance B
 ami           = var.ami
 instance_type = "t2.micro"

 subnet_id = var.test_private_sub_0

 key_name = "tfserverkey"

user_data = filebase64("files/user-datab.sh")


 tags = {
   Name = "Instance B"
 }

 
}







