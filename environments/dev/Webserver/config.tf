terraform {
  backend "s3" {
    bucket = "dev-finalproject-acs730-group10" //bucket to save terraform state of dev environment
    key    = "dev-Webserver/terraform.tfstate"
    region = "us-east-1"
  }
}