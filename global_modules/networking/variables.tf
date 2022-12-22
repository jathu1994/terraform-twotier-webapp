# varible for referencing the default tags for networking folder
variable "default_tags" {
  default     = {}
  type        = map(any)
  description = "deafult tags"
}

# varible for referencing the prefix for networking folder
# variable "prefix" {
#   default     = "acs_group_10"
#   type        = string
#   description = "Name prefix"
# }

# variable to be used for referencing the public subnet cidr range
variable "public_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDRs"
}


# variable to be used for referencing the public subnet cidr range
variable "private_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDRs"
}

# variable to be used for referencing the public subnet cidr range
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR range"
}

# local varoable for referencing the deplyment environment
variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}
