# referencing the networking variables for dev branch
module "network-staging" {
  source        = "../../../global_modules/networking"
  env           = var.env
  vpc_cidr      = var.vpc_cidr
  public_cidrs  = var.public_cidrs
  private_cidrs = var.private_cidrs
  # prefix       = module.global_variables.prefix
  default_tags = module.global_variables.default_tags
}

# referencing the global varibles for dev branch
module "global_variables" {
  source = "../../../global_modules/globalvars"
}