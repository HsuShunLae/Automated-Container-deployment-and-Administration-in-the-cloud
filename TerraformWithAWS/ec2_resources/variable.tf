variable "ami_id" {
  default = "ami-0e063207e92b63437"
}
variable "vpc_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}

variable "key_name" {
    type = string
}