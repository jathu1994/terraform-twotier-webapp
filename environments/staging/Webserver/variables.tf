variable "instance_type" {
  default     = "t3.small"
  description = "Instance Type for staging deployment"
  type        = string
}

variable "env" {
  default     = "staging"
  type        = string
  description = "Environment"
}

variable "linux_key" {
  default     = "/home/ec2-user/.ssh/staging.pub"
  description = "Staging Key"
  type        = string
}