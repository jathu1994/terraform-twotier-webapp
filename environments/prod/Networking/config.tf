# Referencing the s3 bucket for the remote state storage 
terraform {
  backend "s3" {
    bucket = "group10-acs730-prod-bucket"
    key    = "prod-Network/terraform.tfstate"
    region = "us-east-1"
  }
}