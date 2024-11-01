resource "alicloud_nat_gateway" "this" {
  count                = var.use_existing_nat_gateway ? 0 : var.create ? 1 : 0
  vpc_id               = var.vpc_id
  vswitch_id           = var.vswitch_id
  nat_gateway_name     = var.name
  nat_type             = var.nat_type
  specification        = var.specification
  description          = var.description
  payment_type         = var.payment_type != "" ? var.payment_type : var.instance_charge_type == "PostPaid" ? "PayAsYouGo" : "Subscription"
  internet_charge_type = var.internet_charge_type
  period               = var.period
}

locals {
  this_nat_gateway_id = var.use_existing_nat_gateway ? var.existing_nat_gateway_id != "" ? var.existing_nat_gateway_id : var.nat_gateway_id : var.create ? concat(alicloud_nat_gateway.this[*].id, [""])[0] : ""
}

module "eip" {
  count = var.create_eip ? 1 : 0

  source  = "terraform-alicloud-modules/eip/alicloud"
  version = "2.1.0"

  number_of_eips                     = var.number_of_eip
  name                               = var.eip_name
  use_num_suffix                     = var.use_num_suffix
  bandwidth                          = var.eip_bandwidth
  internet_charge_type               = var.eip_internet_charge_type
  instance_charge_type               = var.eip_instance_charge_type
  period                             = var.eip_period
  netmode                            = var.eip_netmode
  allocation_id                      = var.eip_allocation_id
  high_definition_monitor_log_status = var.eip_high_definition_monitor_log_status
  ip_address                         = var.eip_ip_address
  log_project                        = var.eip_log_project
  log_store                          = var.eip_log_store
  public_ip_address_pool_id          = var.eip_public_ip_address_pool_id
  security_protection_types          = var.eip_security_protection_types
  zone                               = var.eip_zone
  tags = merge(
    {
      InstanceType = "Nat"
    }, var.eip_tags
  )
  isp = var.eip_isp
}

resource "alicloud_eip_association" "this" {
  count         = var.create_eip && (var.use_existing_nat_gateway || var.create) ? var.number_of_eip : 0
  allocation_id = module.eip[0].this_eip_id[count.index]
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
  source_cidrs       = var.source_cidrs
  snat_ips           = var.snat_ips
}
