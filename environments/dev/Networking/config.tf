# Referencing the s3 bucket for the remote state storage 
terraform {
  backend "s3" {
    bucket = "dev-finalproject-acs730-group10"
    key    = "dev-Network/terraform.tfstate"
    region = "us-east-1"
  }
}