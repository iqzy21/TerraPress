resource "aws_subnet" "wordpress" {
  vpc_id     = aws_vpc.wordpress.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "wordpressSUBNET"
  }
}