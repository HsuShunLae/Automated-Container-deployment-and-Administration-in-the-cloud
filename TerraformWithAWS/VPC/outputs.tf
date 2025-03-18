output "vpc_id" {
  value = aws_vpc.vpc_for_web_server.id
}
output "public_subnet_id" {
  value = aws_subnet.public.id
}