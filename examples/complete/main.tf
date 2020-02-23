variable "region" {
  default = "cn-hangzhou"
}
provider "alicloud" {
  region = var.region
}


##################################################################
# Data sources to get VPC details
##################################################################
data "alicloud_vpcs" "default" {
  is_default = true
}
// create a new nat gateway
module "nat-gateway" {
  source = "../.."
  region = var.region

  create = true
  vpc_id = data.alicloud_vpcs.default.ids.0
  name   = "nat-gateway-foo"

  // Create eip and bind them with nat gateway
  create_eip    = true
  number_of_eip = 2
  eip_name      = "eip-nat-foo"
}

// set an existing nat gateway and bind two eip
module "existing" {
  source = "../.."
  region = var.region

  use_existing_nat_gateway = true
  existing_nat_gateway_id  = module.nat-gateway.this_nat_gateway_id

  // Create eip and bind them with nat gateway
  create_eip    = true
  number_of_eip = 2
  eip_name      = "eip-nat-bar"
}