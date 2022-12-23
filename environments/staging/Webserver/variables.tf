variable "env" {
  default     = "prod"
  type        = string
  description = "Deployment Environment"
}

variable "public_cidrs" {
  default     = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  type        = list(string)
  description = "Public Subnets"
}

variable "private_cidrs" {
  default     = ["10.100.4.0/24", "10.100.8.0/24", "10.100.9.0/24"]
  type        = list(string)
  description = "Private Subnets"
}

variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "VPC"
}