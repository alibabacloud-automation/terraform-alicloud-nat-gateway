resource "alicloud_snat_entry" "this_snat_entry" {
  count             = var.snat_count != 0 ? var.snat_count : 0
  snat_table_id     = var.snat_table_id
  source_vswitch_id = var.source_vswitch_ids[count.index]
  snat_ip           = var.snat_ips[count.index]
}

