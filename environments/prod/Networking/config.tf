# Referencing the s3 bucket for the remote state storage 
terraform {
  backend "s3" {
    bucket = "prod-finalproject-acs730-group10"
    key    = "prod-Network/terraform.tfstate"
    region = "us-east-1"
  }
}