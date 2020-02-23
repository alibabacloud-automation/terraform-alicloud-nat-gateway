output "this_nat_gateway_id" {
  description = "The nat gateway id."
  value       = module.nat-gateway.this_nat_gateway_id
}
output "this_forward_table_id" {
  description = "The forward table id in this nat gateway. Seem as 'this_dnat_table_id'."
  value       = module.nat-gateway.this_dnat_table_id
}
output "this_dnat_table_id" {
  description = "The dnat table id in this nat gateway."
  value       = module.nat-gateway.this_dnat_table_id
}
output "this_snat_table_id" {
  description = "The snat table id in this nat gateway."
  value       = module.nat-gateway.this_snat_table_id
}
output "this_nat_gateway_name" {
  description = "The nat gateway name."
  value       = module.nat-gateway.this_nat_gateway_name
}
