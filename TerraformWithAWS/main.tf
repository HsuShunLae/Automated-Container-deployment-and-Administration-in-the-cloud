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
    access_key = "AKIA2KBHZO6Q4TYXN5DH"
    secret_key = "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"
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





