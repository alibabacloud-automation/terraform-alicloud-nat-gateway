provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/nat-gateway"
}

resource "alicloud_nat_gateway" "this" {
  count         = var.use_existing_nat_gateway ? 0 : var.create ? 1 : 0
  vpc_id        = var.vpc_id
  name          = var.name
  specification = var.specification
  description   = "A Nat Gateway created by terraform-alicloud-modules/nat-gateway"

  instance_charge_type = var.instance_charge_type
  period               = var.period
  nat_type             = var.nat_type
}

locals {
  this_nat_gateway_id = var.use_existing_nat_gateway ? var.existing_nat_gateway_id != "" ? var.existing_nat_gateway_id : var.nat_gateway_id : var.create ? concat(alicloud_nat_gateway.this.*.id, [""])[0] : ""
}

module eip {
  source                  = "terraform-alicloud-modules/eip/alicloud"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation

  create               = var.create_eip
  number_of_eips       = var.number_of_eip
  name                 = var.eip_name
  use_num_suffix       = true
  bandwidth            = var.eip_bandwidth
  internet_charge_type = var.eip_internet_charge_type
  instance_charge_type = var.eip_instance_charge_type
  period               = var.eip_period
  tags = merge(
    {
      InstanceType = "Nat"
    }, var.eip_tags
  )
  isp = var.eip_isp
}

resource "alicloud_eip_association" "this" {
  count         = var.create_eip && (var.use_existing_nat_gateway || var.create) ? var.number_of_eip : 0
  allocation_id = module.eip.this_eip_id[count.index]
  instance_id   = local.this_nat_gateway_id
}

module "dnat_entry" {
  source = "./modules/dnat_entry"

  ###############################################################
  #variables for dnat entry
  ##############################################################
  dnat_count = var.dnat_count

  forward_table_id = var.forward_table_id
  external_ips     = var.external_ips
  external_ports   = var.external_ports
  ip_protocols     = var.ip_protocols
  internal_ips     = var.internal_ips
  internal_ports   = var.internal_ports
}

module "snat_entry" {
  source = "./modules/snat_entry"

  ###############################################################
  #variables for db snat entry
  ##############################################################
  snat_count = var.snat_count

  snat_table_id      = var.snat_table_id
  source_vswitch_ids = var.source_vswitch_ids
  snat_ips           = var.snat_ips
}

