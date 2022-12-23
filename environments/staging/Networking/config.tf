# Referencing the s3 bucket for the remote state storage 
terraform {
  backend "s3" {
    bucket = "project1bucket1234"
    key    = "env-staging/networking"
    region = "us-east-1"
  }
}
