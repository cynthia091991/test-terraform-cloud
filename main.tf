module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source        = "./ec2"
  instance_type = "t2.nano" 
  instance_name = "product-search-instance"
  subnet_id     = module.vpc.subnet1_id
}

module "s3" {
  source      = "./s3"
  bucket_name = "amazon-images-bucket-093235"
}

module "ec2_new" {
  source        = "./ec2"
  instance_name = "users-project-instance"
  subnet_id     = module.vpc.subnet1_id
}