// Instance_types data source for instance_type
data "alicloud_instance_types" "1c2g" {
  cpu_core_count = "${var.cpu_core_count}"
  memory_size    = "${var.memory_size}"
}
 data "alicloud_zones" "default" {
  "available_instance_type" = "${data.alicloud_instance_types.1c2g.instance_types.0.id}"
  "available_disk_category" = "${var.disk_category}"
}
 // If there is not specifying vpc_id, the module will launch a new vpc
resource "alicloud_vpc" "default" {
  count = "${var.vpc_id == "" ? 1 : 0}"
  name = "${var.vpc_name == "" ? var.resource_group_name : var.vpc_name}"
  cidr_block = "${var.vpc_cidr}"
}
 resource "alicloud_vswitch" "default" {
  vpc_id            = "${alicloud_vpc.default.id}"
  cidr_block        = "${var.vswitch_cidr}"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
}
 resource "alicloud_nat_gateway" "default" {
  vpc_id = "${var.vpc_id == "" ? join("", alicloud_vpc.default.*.id) : var.vpc_id}"
  name = "${var.resource_group_name}"
}
 resource "alicloud_eip" "default" {
  count     = 2
  bandwidth = 5
}
 resource "alicloud_eip_association" "default" {
  count         = 2
  allocation_id = "${element(alicloud_eip.default.*.id, count.index)}"
  instance_id   = "${alicloud_nat_gateway.default.id}"
}
 resource "alicloud_snat_entry" "default" {
  snat_table_id     = "${alicloud_nat_gateway.default.snat_table_ids}"
  source_vswitch_id = "${alicloud_vswitch.default.id}"
  snat_ip           = "${alicloud_eip.default.0.ip_address}"
}
 resource "alicloud_forward_entry" "default" {
  forward_table_id = "${alicloud_nat_gateway.default.forward_table_ids}"
  external_ip      = "${alicloud_eip.default.1.ip_address}"
  external_port    = "${var.external_port}"
  ip_protocol      = "${var.ip_protocol}"
  internal_ip      = "${alicloud_instance.default.private_ip}"
  internal_port    = "${var.internal_port}"
}
 // Security Group Resource for Module
resource "alicloud_security_group" "sg" {
  vpc_id = "${var.vpc_id == "" ? join("", alicloud_vpc.default.*.id) : var.vpc_id}"
  name   = "${var.group_name == "" ? var.resource_group_name : var.group_name}"
}
 resource "alicloud_security_group_rule" "http-in" {
  type              = "${var.type}"
  ip_protocol       = "${var.ip_protocol}"
  nic_type          = "${var.nic_type}"
  policy            = "${var.policy}"
  port_range        = "${var.port_range}"
  priority          = "${var.priority}"
  security_group_id = "${alicloud_security_group.sg.id}"
  cidr_ip           = "${var.cidr_ip}"
}
 resource "alicloud_instance" "default" {
  # cn-beijing
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  security_groups   = ["${alicloud_security_group.sg.id}"]
   vswitch_id = "${alicloud_vswitch.default.id}"
   # series III
  instance_charge_type       = "${var.instance_charge_type}"
  instance_type              = "${var.instance_type}"
  internet_max_bandwidth_out = 0
   system_disk_category = "cloud_efficiency"
  image_id             = "${var.image_id}"
  instance_name   = "${var.instance_name == "" ? var.resource_group_name : var.instance_name}"
}