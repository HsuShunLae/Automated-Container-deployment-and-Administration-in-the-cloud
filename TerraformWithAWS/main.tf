terraform{

    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.87.0"
        }
  }

  required_version = ">= 1.10.5"
}
provider "aws" {
    region = "eu-west-1"
    access_key = ${{ secrets.access_key }} //input your access_key
    secret_key = ${{ secrets.secret_key }}  //input your secret_key
}

module "VPC" {
  source = "./VPC"
  vpc_id = module.VPC.vpc_id
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.VPC.vpc_id
}

module "key_pair" {
  source = "./key_pair"

}

module "ec2_resources" {
  source = "./ec2_resources"

  vpc_id = module.VPC.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.VPC.public_subnet_id
  key_name = module.key_pair.key_name
}





