# Referencing the s3 bucket for the remote state storage 
terraform {
  backend "s3" {
    bucket = "group10-acs730-dev-bucket"
    key    = "dev-Network/terraform.tfstate"
    region = "us-east-1"
  }
}