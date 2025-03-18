resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"
  public_key = file("${path.module}/public_key.pub") 
}

