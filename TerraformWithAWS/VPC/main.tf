resource "aws_vpc" "vpc_for_web_server" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc_for_web_server"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc_for_web_server.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_for_web_server.id

  tags = {
    Name = "my_internet_gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_for_web_server.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}