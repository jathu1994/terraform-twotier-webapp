# Variable for  referencing the deployment environment
variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}

# variable for defining the public subnet range for public subnets
variable "public_cidrs" {
  default     = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  type        = list(string)
  description = "Public Subnet range"
}

# variable for defining the private subnet range for public subnets
variable "private_cidrs" {
  default     = ["10.100.4.0/24", "10.100.5.0/24", "10.100.6.0/24"]
  type        = list(string)
  description = "Private Subnet range"
}

# variable for defining the vpc cidr network address 
variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "VPC CIDR range"
}