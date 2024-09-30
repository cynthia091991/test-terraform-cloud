output "vpc_id" {
    value = aws_vpc.dreambig_vpc.id
}


# output "test" {
#   value = var.test[*].ids 
# }

output "test_private_sub" {
  value = var.test["private_sub"] # this will output all the private subnets 
}

output "test_private_sub_0" {
  value = aws_subnet.private_sub[0].id # output just an id of the first subnet 
}

output "sg-ids" {
  value = aws_security_group.dreambig_sg.id
}

output "test_public_sub" {
  value = var.test["public_sub"]

  }

  output "db-subnet-group" {
    value = aws_db_subnet_group.default.id
    
  }

  output "eip_dns" {
    value = aws_eip.bar.public_dns
  }

  