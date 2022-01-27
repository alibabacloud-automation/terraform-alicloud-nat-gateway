resource "alicloud_forward_entry" "this_forward_entry" {
  count            = var.dnat_count
  forward_table_id = var.forward_table_id
  external_ip      = var.external_ips[count.index]
  external_port    = var.external_ports[count.index]
  ip_protocol      = var.ip_protocols[count.index]
  internal_ip      = var.internal_ips[count.index]
  internal_port    = var.internal_ports[count.index]
}