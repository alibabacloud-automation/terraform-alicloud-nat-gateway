

resource "alicloud_snat_entry" "this_snat_entry" {
  count             = var.snat_count
  snat_table_id     = var.snat_table_id
  source_vswitch_id = length(var.source_cidrs) > 0 ? (length(var.source_vswitch_ids) > 0 ? var.source_vswitch_ids[count.index] : null) : var.source_vswitch_ids[count.index]
  source_cidr       = length(var.source_vswitch_ids) > 0 ? null : var.source_cidrs[count.index]
  snat_ip           = var.snat_ips[count.index]
}
