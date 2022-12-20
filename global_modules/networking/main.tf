# block for aws region selection
provider "aws" {
  region = "us-east-1"
}


#creating aws ec2 instance
resource "aws_instance" "my_amazon" {
  ami           = "ami-08e4e35cccc6189f4"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.project1.key_name
  
  }
  
  # Creating a key pair for ec2 instance
  resource "aws_key_pair" "project1" {
  key_name   = // name of the key
  public_key = // public key
}
