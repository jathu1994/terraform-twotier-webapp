terraform {
  backend "s3" {
    bucket = // bucket name               
    key    = // path of the key
    region = "us-east-1"                          
  }
}