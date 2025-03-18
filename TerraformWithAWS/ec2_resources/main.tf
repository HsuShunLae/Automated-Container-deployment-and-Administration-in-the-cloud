resource "aws_instance" "my_web_server" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]
  subnet_id     = var.public_subnet_id
  key_name = var.key_name
  tags = {
    Name = "My Web Server"
  }
}