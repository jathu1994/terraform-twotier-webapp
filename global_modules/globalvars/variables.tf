# default tags variable for referencing globally
output "default_tags" {
  value = {
    "Group"   = "group_10"
    "Members" = "Anuj,Jatharthan,Chathumi"
  }
}

# Prefix varible for referencing globally 
output "prefix" {
  value     = "acs_group_10"
}