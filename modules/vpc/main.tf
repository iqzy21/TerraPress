resource "aws_vpc" "wordpress" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "WordPress VPC"
  }
}

resource "aws_subnet" "wordpress" {
  vpc_id     = aws_vpc.wordpress.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "wordpressSUBNET"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.wordpress.id

  tags = {
    Name = "wordpressInternetGateway"
  }
}

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

resource "aws_security_group" "wordpress" {
  name        = "wordpressSG"
  description = "Allow EC2 wordpress inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.wordpress.id
  tags = {
    Name = "wordpressSG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.wordpress.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "inbound_http" {
  security_group_id = aws_security_group.wordpress.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "outbound_all" {
  security_group_id = aws_security_group.wordpress.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}