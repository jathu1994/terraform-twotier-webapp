terraform {
  backend "s3" {
    bucket = "dev-group-10-finalproject" //bucket to save terraform state of dev environment
    key    = "dev-WebServer/terraform.tfstate"
    region = "us-east-1"
  }
}