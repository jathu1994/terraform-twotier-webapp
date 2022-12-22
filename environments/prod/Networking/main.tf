# referencing the networking variables for production branch
module "network-dev" {
  source       = "../../../global_modules/networking"
  env          = var.env
  vpc_cidr     = var.vpc_cidr
  public_cidr  = var.public_subnet_cidrs
  private_cidr = var.private_subnet_cidrs
  prefix       = module.global_variables.prefix
  default_tags = module.global_variables.default_tags
}

# referencing the global varibles for production branch
module "global_variables" {
  source = "../../../global_modules/global_variables"
}