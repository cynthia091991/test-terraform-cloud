provider "aws" {
  region     = "eu-south-1"         # Change this to your desired region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
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

