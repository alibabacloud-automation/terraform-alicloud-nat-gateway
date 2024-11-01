locals {
  this_dnat_table_id           = var.use_existing_nat_gateway ? (length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways[*].forward_table_ids[0], [""])[0] : "") : (var.create ? concat(alicloud_nat_gateway.this[*].forward_table_ids, [""])[0] : "")
  this_snat_table_id           = var.use_existing_nat_gateway ? (length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways[*].snat_table_ids[0], [""])[0] : "") : (var.create ? concat(alicloud_nat_gateway.this[*].snat_table_ids, [""])[0] : "")
  this_nat_gateway_spec        = var.use_existing_nat_gateway ? (length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways[*].spec, [""])[0] : "") : (var.create ? concat(alicloud_nat_gateway.this[*].spec, [""])[0] : "")
  this_nat_gateway_name        = var.use_existing_nat_gateway ? (length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways[*].nat_gateway_name, [""])[0] : "") : (var.create ? concat(alicloud_nat_gateway.this[*].nat_gateway_name, [""])[0] : "")
  this_nat_gateway_status      = var.use_existing_nat_gateway ? (length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways[*].status, [""])[0] : "") : (var.create ? concat(alicloud_nat_gateway.this[*].status, [""])[0] : "")
  this_nat_gateway_description = var.use_existing_nat_gateway ? (length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways[*].description, [""])[0] : "") : (var.create ? concat(alicloud_nat_gateway.this[*].description, [""])[0] : "")
}

data "alicloud_nat_gateways" "this" {
  ids = local.this_nat_gateway_id != "" ? [local.this_nat_gateway_id] : null
}

output "this_nat_gateway_id" {
  description = "The nat gateway id."
  value       = local.this_nat_gateway_id
}

output "this_forward_table_id" {
  description = "The forward table id in this nat gateway. Seem as 'this_dnat_table_id'."
  value       = local.this_dnat_table_id
}

output "this_dnat_table_id" {
  description = "The dnat table id in this nat gateway."
  value       = local.this_dnat_table_id
}

output "this_snat_table_id" {
  description = "The snat table id in this nat gateway."
  value       = local.this_snat_table_id
}

output "this_nat_gateway_name" {
  description = "The nat gateway name."
  value       = local.this_nat_gateway_name
}

output "this_nat_gateway_spec" {
  description = "The nat gateway spec."
  value       = local.this_nat_gateway_spec
}

output "this_nat_gateway_description" {
  description = "The nat gateway id."
  value       = local.this_nat_gateway_description
}

output "this_nat_gateway_status" {
  description = "The nat gateway id."
  value       = local.this_nat_gateway_status
}

output "this_eip_ids" {
  description = "The id of new eips."
  value       = flatten(module.eip[*].this_eip_id)
}

output "this_eip_ips" {
  description = "The id of new eip addresses."
  value       = flatten(module.eip[*].this_eip_address)
}

output "snat_entry_id" {
  value       = module.snat_entry.snat_entry_id
  description = "The id of snat entry."
}

output "snat_entry_source_cidr" {
  value       = module.snat_entry.snat_entry_source_cidr
  description = "The source cidr of snat entry."
}

output "snat_entry_source_vswitch_id" {
  value       = module.snat_entry.snat_entry_source_vswitch_id
  description = "The source vswitch id of snat entry."
}
