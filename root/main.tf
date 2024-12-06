terraform  {
required_providers{
 aws = {
source = "hashicorp/aws"
version = "~> 5.0"
 }
required_version = ">= 1.9.6"
}
}
provider "aws" {
  region     = "eu-south-1"         # Change this to your desired region
  default    = profile
}

module "vpc" {
  source = "../vpc"
}

module "ec2" {

  source                  = "../ec2"
  instance_type           = var.instance_type 
  instance_name           = "${upper("dreambig-web")}"
  test_private_sub_0      = module.vpc.test_private_sub_0
  ami                     = var.ami  
  region                  = var.region
  vpc_id                  = var.vpc_id
  sg-ids                  = [module.vpc.sg-ids]                   

  
}

module "s3" {
  source      = "../s3"
  bucket_name = "dreambig-images-039483" 
}

