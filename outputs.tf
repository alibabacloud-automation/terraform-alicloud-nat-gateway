locals {
  this_dnat_table_id           = local.this_nat_gateway_id != "" ? length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways.*.forward_table_ids[0], [""])[0] : concat(alicloud_nat_gateway.this.*.forward_table_ids, [""])[0] : ""
  this_snat_table_id           = local.this_nat_gateway_id != "" ? length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways.*.snat_table_ids[0], [""])[0] : concat(alicloud_nat_gateway.this.*.snat_table_ids, [""])[0] : ""
  this_nat_gateway_spec        = local.this_nat_gateway_id != "" ? length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways.*.spec, [""])[0] : concat(alicloud_nat_gateway.this.*.spec, [""])[0] : ""
  this_nat_gateway_name        = local.this_nat_gateway_id != "" ? length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways.*.name, [""])[0] : concat(alicloud_nat_gateway.this.*.name, [""])[0] : ""
  this_nat_gateway_status      = local.this_nat_gateway_id != "" ? length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways.*.status, [""])[0] : concat(alicloud_nat_gateway.this.*.status, [""])[0] : ""
  this_nat_gateway_description = local.this_nat_gateway_id != "" ? length(data.alicloud_nat_gateways.this.gateways) > 0 ? concat(data.alicloud_nat_gateways.this.gateways.*.description, [""])[0] : concat(alicloud_nat_gateway.this.*.description, [""])[0] : ""
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
  value       = module.eip.this_eip_id
}

output "this_eip_ips" {
  description = "The id of new eip addresses."
  value       = module.eip.this_eip_address
}