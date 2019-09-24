variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

##############################################################
#variables for alicloud_nat_gateway
##############################################################

variable "name" {
  default = "terraform-alicloud-nat-gateway"
}

variable "vpc_id" {
  description = "An existing vpc id used to create a new nat gateway."
}

variable "vswitch_cidrs" {
  description = "List of cidr blocks used to launch several new vswitches."
  type        = list(string)
}

variable "nat_gateway_id" {
  description = "The id of an existing nat gateway."
  default     = ""
}

variable "specification" {
  description = "The specification of nat gateway."
  default     = "Small"
}

variable "description" {
  description = "The description of nat gateway."
  default     = "terraform-alicloud-nat-gateway"
}

###############################################################
#variables for alicloud_dnat_entry
##############################################################

variable "dnat_count" {
  description = "Number of dnat entry."
}

variable "forward_table_id" {
  description = "The forward table id of dnat entry."
}

variable "external_ips" {
  type        = list(string)
  description = "The external ip id of dnat entry. The length should be equal to dnat_count."
}

variable "internal_ips" {
  type        = list(string)
  description = "The internal ip of dnat entry. The length should be equal to dnat_count."
}

variable "external_ports" {
  type        = list(string)
  description = "The external port of dnat entry. The length should be equal to dnat_count."
}

variable "internal_ports" {
  type        = list(string)
  description = "The internal port of dnat entry. The length should be equal to dnat_count."
}

variable "ip_protocols" {
  type        = list(string)
  description = "The ip protocols of dnat entry. The length should be equal to dnat_count."
}

##############################################################
#variables for alicloud_snat_entry
##############################################################

variable "snat_count" {
  description = "Number of snat entry."
}

variable "snat_table_id" {
  description = "The snat table id of nat gateway."
}

variable "source_vswitch_ids" {
  type        = list(string)
  description = "The vswitch ids. The length should be equal to snat_count."
}

variable "snat_ips" {
  type        = list(string)
  description = "The snat ips of the nat gateway. The length should be equal to snat_count."
}

