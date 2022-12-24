terraform {
  backend "s3" {
    bucket = "staging-finalproject-acs730-group10" //bucket to save terraform state of dev environment
    key    = "staging-Webserver/terraform.tfstate"
    region = "us-east-1"
  }
}