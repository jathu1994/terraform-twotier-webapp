# Instance type
variable "instance_type" {
  default     = "t3.micro"
  description = "Type of the instance"
  type        = string
}


# Variable to signal the current environment 
variable "env" {
  default     = "staging"
  type        = string
  description = "Deployment Environment"
}

#Desired Capacity 
variable "desired_size" {
  default     = 2
  type        = number
  description = "Optimal Capacity"
}

#Minimum group size for auto scaling
variable "minimum_size" {
  default     = 2
  type        = number
  description = "Minimum group size for auto scaling"
}
#Maximum group size for auto scaling
variable "maximum_size" {
  default     = 3
  type        = number
  description = "Maximum group size for auto scaling"
}


variable "path_to_ssh_key" {
  default     = "/home/ec2-user/.ssh/dev.pub"
  description = "Path to the public key to use in Linux VMs provisioning"
  type        = string
}