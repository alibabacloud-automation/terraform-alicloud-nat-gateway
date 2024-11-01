data "alicloud_zones" "default" {
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  version            = "~>1.11.0"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones[0].id]
}

# create a new nat gateway
module "nat_gateway" {
  source = "../.."

  #alicloud_nat_gateway
  use_existing_nat_gateway = false
  create                   = true

  vpc_id               = module.vpc.this_vpc_id
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  name                 = var.name
  nat_type             = var.nat_type
  specification        = var.specification
  description          = var.description
  payment_type         = "PayAsYouGo"
  internet_charge_type = "PayByLcu"
  period               = var.period

  #eip
  create_eip = false

}

module "use_existing_id" {
  source = "../.."

  #alicloud_nat_gateway
  use_existing_nat_gateway = true
  create                   = false

  #eip
  create_eip = true

  number_of_eip            = 2
  existing_nat_gateway_id  = module.nat_gateway.this_nat_gateway_id
  eip_name                 = "TF-EIP-for-Nat"
  use_num_suffix           = false
  eip_bandwidth            = var.eip_bandwidth
  eip_internet_charge_type = "PayByTraffic"
  eip_instance_charge_type = "PostPaid"
  eip_period               = var.eip_period
  eip_tags                 = var.eip_tags
  eip_isp                  = "BGP"

}

module "dnat_entry" {
  source = "../../modules/dnat_entry"

  #variables for dnat entry
  dnat_count = 1

  forward_table_id = module.nat_gateway.this_forward_table_id
  external_ips     = module.use_existing_id.this_eip_ips
  external_ports   = var.external_ports
  ip_protocols     = var.ip_protocols
  internal_ips     = var.internal_ips
  internal_ports   = var.internal_ports
}

module "snat_entry" {
  source = "../../modules/snat_entry"

  #variables for db snat entry
  snat_count = 1

  snat_table_id = module.nat_gateway.this_snat_table_id
  # source_vswitch_ids = module.vpc.this_vswitch_ids
  source_cidrs = [module.vpc.cidr_block]
  snat_ips     = module.use_existing_id.this_eip_ips
}
