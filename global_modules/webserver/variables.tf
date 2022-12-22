variable "default_tags" {
  default     = {}
  type        = map(any)
  description = "tags for all deployed resorces where ever needed"
}

variable "prefix" {
  type        = string
  description = "prefix from global variable"
}

variable "instance_type" {

  description = "Type of the instance to be supplied by each environments"
  type        = string
}

variable "env" {

  type        = string
  description = "Deployment Environment value supplied by each environment specific deployment"
}

variable "linux_key" {

  description = "key for each environment supplied by each environment specific deployment"
  type        = string
}