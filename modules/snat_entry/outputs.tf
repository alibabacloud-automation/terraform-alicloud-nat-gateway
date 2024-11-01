output "snat_entry_id" {
  value       = alicloud_snat_entry.this_snat_entry[*].id
  description = "The id of snat entry."
}

output "snat_entry_source_cidr" {
  value       = alicloud_snat_entry.this_snat_entry[*].source_cidr
  description = "The source cidr of snat entry."
}

output "snat_entry_source_vswitch_id" {
  value       = alicloud_snat_entry.this_snat_entry[*].source_vswitch_id
  description = "The source vswitch id of snat entry."
}