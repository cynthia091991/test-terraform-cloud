locals {
  Name               = "dreambig-staging"
  owner              = "dream big team" 
  Environment        = "staging"
  
}
#comon tags to be assign to all resources

locals {
  common_tags = {
  Name    = local.Name
  owner      =  local.owner
  Environment =  local.Environment

  }
}

/// Locals can be assigned to any valid Terraform data type, such as a string, list, map, or object. 
/// The actual values can come from input variables, resource attributes, or other local values defined in the configuration.

# locals {
#   environment = "development"
#   server_list = ["web", "app", "db"]
#   subnet_map  = {
#     web = var.web_subnet
#     app = var.app_subnet
#     db  = var.db_subnet
#   }
# } 

// if the default variable create_load_balancer is true then it will use the dns
// else if the default variable create_load_balancer is false then it will use the public dns of the elastic ip

# locals {
#   dns_entry = var.create_load_balancer ? 
#                 aws_lb.example.dns_name : aws_eip.bar.public_dns
# }