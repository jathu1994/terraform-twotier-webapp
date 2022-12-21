variable "default_tags" {
  default     = {}
  type        = map(any)
  description = "deafult tag"

}

variable "prefix" {
  default     = "Group10"
  type        = string
  description = "Name prefix"
}

variable "public_cidr" {
  type        = list(string)
  description = "Public Subnet CIDRs"
}

variable "private_cidr" {
  type        = list(string)
  description = "Private Subnet CIDRs"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR range"
}

variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}
