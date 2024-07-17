provider "aws" {
  region     = "us-east-1"         # Change this to your desired region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

module "vpc" {
  source = "../vpc"
}

module "ec2" {
  source        = "../ec2"
  instance_type = var.instance_type 
  instance_name = "product-search-instance"
  subnet_id     = module.vpc.subnet1_id
  ImageId       = var.ImageId  
  region        = var.region
}

module "s3" {
  source      = "../s3"
  bucket_name = "amazon-images-bucket-093235"
}

module "ec2_new" {
  source        = "../ec2"
  instance_name = "users-project-instance"
  subnet_id     = module.vpc.subnet1_id
}