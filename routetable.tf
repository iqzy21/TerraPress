resource "aws_route_table" "wordpress" {
  vpc_id = aws_vpc.wordpress.id

route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "wordpressroutetable"
  }
  
}

resource "aws_route_table_association" "main-subnet" {
  subnet_id = aws_subnet.wordpress.id
  route_table_id = aws_route_table.wordpress.id
}
