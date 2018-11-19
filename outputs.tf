output "instance_id" {
  value = "${alicloud_instance.default.id}"
}
 output "ip_addresses" {
  value = "${join(",", alicloud_eip.default.*.ip_address)}"
}
 output "vpc_id" {
  description = "The ID of the VPC."
  value = "${var.vpc_id == ""? join("", alicloud_vpc.default.*.id) : var.vpc_id}"
}
 output "vswitch_ids" {
  description = "List ID of the VSwitches."
  value       = "${length(var.vswitch_ids) > 0 ? join(",", var.vswitch_ids) : join(",", alicloud_vswitch.default.*.id)}"
} 