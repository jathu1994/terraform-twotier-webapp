# Referencing the s3 bucket for the remote state storage 
terraform {
  backend "s3" {
    bucket = "staging-finalproject-acs730-group10"
    key    = "staging-Network/terraform.tfstate"
    region = "us-east-1"
  }
}