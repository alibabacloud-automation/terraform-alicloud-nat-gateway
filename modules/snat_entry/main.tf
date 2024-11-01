

resource "alicloud_snat_entry" "this_snat_entry" {
  count             = var.snat_count
  snat_table_id     = var.snat_table_id
  source_vswitch_id = var.source_vswitch_ids[count.index]
  source_cidr       = length(var.source_vswitch_ids) > 0 ? null : var.source_cidrs[count.index]
  snat_ip           = var.snat_ips[count.index]
}
