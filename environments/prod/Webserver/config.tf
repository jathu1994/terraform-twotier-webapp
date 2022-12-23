terraform {
  backend "s3" {
    bucket = "prod-finalproject-acs730-group10" //bucket to save terraform state of dev environment
    key    = "prod-WebServer/terraform.tfstate"
    region = "us-east-1"
  }
}