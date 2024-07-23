resource "aws_security_group" "dreambig_sg" {
  for_each    = local.security_groups   
  name        = each.value.name
  description = each.value.description
  vpc_id      = aws_vpc.dreambig_vpc.id

  dynamic "ingress" {
    for_each = each.value.ingress
    #iterator = port
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      security_groups  = lookup(ingress.value, "security_groups", null)
    }

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

   

