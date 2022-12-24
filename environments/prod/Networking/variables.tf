# Variable for  referencing the deployment environment
variable "env" {
  default     = "prod"
  type        = string
  description = "Deployment Environment"
}

# variable for defining the public subnet range for public subnets
variable "public_cidrs" {
  default     = ["10.250.1.0/24", "10.250.2.0/24", "10.250.3.0/24"]
  type        = list(string)
  description = "Public Subnet range"
}

# variable for defining the private subnet range for public subnets
variable "private_cidrs" {
  default     = ["10.250.4.0/24", "10.250.5.0/24", "10.250.6.0/24"]
  type        = list(string)
  description = "Private Subnet range"
}

# variable for defining the vpc cidr network address 
variable "vpc_cidr" {
  default     = "10.250.0.0/16"
  type        = string
  description = "VPC CIDR range"
}