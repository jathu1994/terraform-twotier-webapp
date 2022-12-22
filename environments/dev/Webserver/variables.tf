variable "instance_type" {
  default     = "t3.micro"
  description = "Instance Type for dev deployment"
  type        = string
}

variable "env" {
  default     = "dev"
  type        = string
  description = "Environment"
}

variable "linux_key" {
  default     = "/home/ec2-user/.ssh/dev.pub"
  description = "Dev Key"
  type        = string
}