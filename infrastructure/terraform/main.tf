module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  custom_cidr = var.custom_cidr
}

module "ec2" {
  source                 = "./modules/ec2"
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = module.vpc.subnet_id
}

