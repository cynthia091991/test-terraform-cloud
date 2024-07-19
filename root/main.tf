provider "aws" {
  region     = "us-east-1"         # Change this to your desired region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

module "vpc" {
  source = "../vpc"
}

module "ec2" {
  source               = "../ec2"
  instance_type        = var.instance_type 
  instance_name        = "product-search-instance"
  test_private_sub_0   = module.vpc.test_private_sub_0
  ImageId              = var.ImageId 
  region               = var.region
  vpc_id               = var.vpc_id
}

module "s3" {
  source      = "../s3"
  bucket_name = "cynthia-images-039483"
}

# module "ec2_new" {
#   source        = "../ec2"
#   instance_name = "users-project-instance"
#  test_private_sub_0   = module.vpc.test_private_sub_0
# }