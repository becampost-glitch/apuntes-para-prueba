provider "aws" {
  region = var.region
}

# Variables locales (Locals)
locals {
  environment = "practica"
}

module "vpc" {
  source              = "./modulos/vpc"
  vpc_name            = "vpc-${local.environment}"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  azs                 = ["us-east-1a", "us-east-1b"]
}

module "s3" {
  source      = "./modulos/s3"
  bucket_name = "mi-bucket-prueba-terraform-2026"
  environment = local.environment
}

module "ec2" {
  source         = "./modulos/ec2"
  instance_count = 2
  ami_id         = "ami-0c55b159cbfafe1f0"
  instance_type  = "t3.micro"
  subnet_ids     = module.vpc.public_subnet_ids
}

module "alb" {
  source     = "./modulos/alb"
  alb_name   = "alb-${local.environment}"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  target_ids = module.ec2.instance_ids
}