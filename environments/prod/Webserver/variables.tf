variable "instance_type" {
  default     = "t3.medium"
  description = "Instance Type for prod deployment"
  type        = string
}

variable "env" {
  default     = "prod"
  type        = string
  description = "Environment"
}

variable "linux_key" {
  default     = "/home/ec2-user/.ssh/prod.pub"
  description = "prod Key"
  type        = string
}