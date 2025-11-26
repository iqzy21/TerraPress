resource "aws_instance" "wordpress" {
  tags = {
    Name = "Wordpress"
  }

  ami = "ami-0a0ff88d0f3f85a14"
  instance_type = "t2.micro"

  key_name = "wordpress"

  vpc_security_group_ids = [ var.WP_security_id ]
  subnet_id = var.WP_subnet_id

  associate_public_ip_address = true

  user_data = file("cloud-init.sh")

}
