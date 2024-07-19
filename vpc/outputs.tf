output "vpc_id" {
    value = aws_vpc.main.id
}

# output "subnet1_id" {
#     value = aws_subnet.subnet1.id
# }

output "test" {
  value = var.test 
}

output "test_private_sub" {
  value = var.test["private_sub"] # this will output all the private subnets 
}

output "test_private_sub_0" {
  value = aws_subnet.private_sub[0].id # output just an id of the first subnet 
}
#aws_subnet.private[0].id
#}