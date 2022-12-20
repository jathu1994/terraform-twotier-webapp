variable "default_tags" {
  default = {
    "Group" = "10"
   
}

# Step 8 - Add variables
variable "prefix" {
  default     = "Group10"
  type        = string
  description = "Name prefix"