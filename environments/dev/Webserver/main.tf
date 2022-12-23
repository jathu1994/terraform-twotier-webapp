#imorting global varibales
module "globalvars" {
  source = "../../../global_modules/globalvars"
}

#
module "dev-webServer" {
  source            = "../../../global_modules/webserver"
  env               = var.env
  instance_type     = var.instance_type
  path_to_ssh_key  = var.path_to_ssh_key
  maximum_size     = var.maximum_size
  minimum_size     = var.minimum_size
  desired_size = var.desired_size
  default_tags = module.globalvars.default_tags

}