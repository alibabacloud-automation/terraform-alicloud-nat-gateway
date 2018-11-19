variable "resource_group_name" {
  default = "tf-module-nat-gateway"
}
 variable "instance_name" {
  description = "The instance name. Default to variable `resource_group_name`."
  default     = ""
}
 variable "instance_type" {
  description = "The instance type used to launch one or more ecs instances."
  default = "ecs.n4.small"
}
 variable "image_id" {
  description = "The image id used to launch one or more ecs instances."
  default = "ubuntu_140405_64_40G_cloudinit_20161115.vhd"
}
 variable "disk_category" {
  description = "The data disk category used to launch one or more data disks."
  default = "cloud_efficiency"
}
 # VPC variables
variable "vpc_name" {
  description = "The vpc name used to create a new vpc when 'vpc_id' is not specified. Default to variable `resource_group_name`"
  default     = ""
}
 variable "vpc_id" {
  description = "An existing vpc id used to create several vswitches and other resources."
  default     = ""
}
 variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc when 'vpc_id' is not specified."
  default = "10.1.0.0/21"
}
 # VSwitch variables
variable "vswitch_ids" {
  description = "List existing vswitches id used to create ECS and RDS instance."
  type        = "list"
  default     = []
}
 variable "vswitch_cidr" {
  description = "The cidr block used to launch a new vswitch when 'vswitch_id' is not specified."
  default = "10.1.1.0/24"
}
 # Security Group variables
variable "group_name" {
  description = "The security group name. Default to variable `resource_group_name`."
  default     = ""
}
 # Instance typs variables
variable "cpu_core_count" {
  description = "CPU core count is used to fetch instance types."
  default     = 1
}
 variable "memory_size" {
  description = "Memory size used to fetch instance types."
  default     = 2
}
 variable "external_port" {
  description = "The external port of dnat entry."
  default     = "80"
}
 variable "internal_port" {
  description = "The internal port of dnat entry."
  default     = "8080"
}
 # Security group rule variables
variable "ip_protocol" {
  description = "The ip protocol of dnat entry."
  default     = "tcp"
}
 variable "type" {
  description = "The type of the security group rule."
  default     = "ingress"
}
 variable "nic_type" {
  description = "The nic type of the security group rule."
  default     = "intranet"
}
 variable "policy" {
  description = "The policy of the security group rule."
  default     = "accept"
}
 variable "port_range" {
  description = "The port range of the security group rule."
  default     = "80/80"
}
 variable "priority" {
  description = "The priority of the security group rule."
  default     = 1
}
 variable "cidr_ip" {
  description = "The cidr ip of the security group rule."
  default     = "0.0.0.0/0"
}
 variable "instance_charge_type" {
  description = "The charge type of instance. Choices are 'PostPaid' and 'PrePaid'."
  default     = "PostPaid"
} 