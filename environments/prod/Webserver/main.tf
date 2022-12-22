#imorting global varibales
module "globalvars" {
  source = "../../../global_modules/globalvars"
}

#
module "dev-webServer" {
  source            = "../../../global_modules/webserver"
  env               = var.env
  instance_type     = var.instance_type
  linux_key         = var.linux_key
  prefix            = module.globalvars.prefix
  default_tags      = module.globalvars.default_tags

}