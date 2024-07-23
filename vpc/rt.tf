resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dreambig_vpc.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = aws_internet_gateway.main.id
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id       = aws_vpc.dreambig_vpc.id
}

# Associate public route table with public subnets
resource "aws_route_table_association" "public" {
  count           = length(aws_subnet.public_sub)
  subnet_id       = aws_subnet.public_sub[count.index].id
  route_table_id  = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id       = aws_vpc.dreambig_vpc.id
}

# Associate private route table with private subnets
resource "aws_route_table_association" "private" {
  count             = length(aws_subnet.private_sub)
  subnet_id         = aws_subnet.private_sub[count.index].id
  route_table_id    = aws_route_table.private.id
}