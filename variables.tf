

variable "instance_charge_type" {
  description = "(Deprecated from version 1.4.0) The charge type of the nat gateway. Choices are 'PostPaid' and 'PrePaid'. Use payment_type instead."
  type        = string
  default     = "PostPaid"
}

##############################################################
#variables for nat gateway
##############################################################
variable "create" {
  description = "Whether to create nat gateway. If false, you can specify an existing nat gateway by setting 'nat_gateway_id'."
  type        = bool
  default     = true
}

variable "use_existing_nat_gateway" {
  description = "Whether to create nat gateway. If true, you can specify an existing nat gateway by setting 'nat_gateway_id'."
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "ID of the VPC where to create nat gateway."
  type        = string
  default     = ""
}

variable "vswitch_id" {
  description = "ID of the vswitch where to create nat gateway."
  type        = string
  default     = ""
}

variable "name" {
  description = "Name of a new nat gateway."
  type        = string
  default     = ""
}

variable "nat_type" {
  description = "The type of NAT gateway."
  type        = string
  default     = "Enhanced"
}

variable "specification" {
  description = "The specification of nat gateway."
  type        = string
  default     = "Small"
}

variable "description" {
  description = "The description of nat gateway."
  type        = string
  default     = ""
}

variable "payment_type" {
  description = "The billing method of the NAT gateway."
  type        = string
  default     = "PayAsYouGo"
}

variable "internet_charge_type" {
  description = "The internet charge type."
  type        = string
  default     = "PayByLcu"
}

variable "period" {
  description = "The charge duration of the PrePaid nat gateway, in month."
  type        = number
  default     = 1
}

########################
# New EIP parameters
########################
variable "create_eip" {
  description = "Whether to create new EIP and bind it to this Nat gateway. If true, the 'number_of_eip' should not be empty."
  type        = bool
  default     = false
}

variable "number_of_eip" {
  description = "Number of EIP instance used to bind with this Nat gateway."
  type        = number
  default     = 1
}

variable "existing_nat_gateway_id" {
  description = "The id of an existing nat gateway."
  type        = string
  default     = ""
}

variable "eip_name" {
  description = "Name to be used on all eip as prefix. Default to 'TF-EIP-for-Nat'. The final default name would be TF-EIP-for-Nat001, TF-EIP-for-Nat002 and so on."
  type        = string
  default     = ""
}

variable "use_num_suffix" {
  description = "Always append numerical suffix to instance name, even if number_of_instances is 1"
  type        = bool
  default     = false
}

variable "eip_bandwidth" {
  description = "Maximum bandwidth to the elastic public network, measured in Mbps (Mega bit per second)."
  type        = number
  default     = 5
}

variable "eip_internet_charge_type" {
  description = "Internet charge type of the EIP, Valid values are `PayByBandwidth`, `PayByTraffic`. "
  type        = string
  default     = "PayByTraffic"
}

variable "eip_instance_charge_type" {
  description = "Elastic IP instance charge type."
  type        = string
  default     = "PostPaid"
}

variable "eip_period" {
  description = "The duration that you will buy the EIP, in month."
  type        = number
  default     = 1
}

variable "eip_tags" {
  description = "A mapping of tags to assign to the EIP instance resource."
  type        = map(string)
  default     = {}
}

variable "eip_isp" {
  description = "The line type of the Elastic IP instance."
  type        = string
  default     = "BGP"
}

variable "eip_netmode" {
  description = "The network type. By default, this value is set to `public`, which specifies the public network type."
  type        = string
  default     = null
}

variable "eip_allocation_id" {
  description = "The ID of the EIP instance."
  type        = string
  default     = null
}

variable "eip_high_definition_monitor_log_status" {
  description = "The status of fine-grained monitoring."
  type        = string
  default     = null
}

variable "eip_ip_address" {
  description = "The IP address of the EIP. Supports a maximum of 50 EIPs."
  type        = string
  default     = null
}

variable "eip_log_project" {
  description = "The name of the Simple Log Service (SLS) project."
  type        = string
  default     = null
}

variable "eip_log_store" {
  description = "The name of the Logstore."
  type        = string
  default     = null
}

variable "eip_public_ip_address_pool_id" {
  description = "The ID of the IP address pool."
  type        = string
  default     = null
}

variable "eip_security_protection_types" {
  description = "Security protection level."
  type        = list(string)
  default     = []
}

variable "eip_zone" {
  description = "The zone of the EIP."
  type        = string
  default     = null
}

variable "nat_gateway_id" {
  description = "(Deprecated) It has been deprecated from 1.2.0 and use 'existing_nat_gateway_id' instead."
  type        = string
  default     = ""
}

#variables for alicloud_dnat_entry
variable "dnat_count" {
  description = "(Deprecated) It has been deprecated from 1.2.0. Number of dnat entry."
  type        = number
  default     = 0
}

variable "forward_table_id" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The forward table id of dnat entry."
  type        = string
  default     = ""
}

variable "external_ips" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The external ip id of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "internal_ips" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The internal ip of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "external_ports" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The external port of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "internal_ports" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The internal port of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "ip_protocols" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The ip protocols of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

#variables for alicloud_snat_entry
variable "snat_count" {
  description = "(Deprecated) It has been deprecated from 1.2.0. Number of snat entry."
  type        = number
  default     = 0
}

variable "snat_table_id" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The snat table id of nat gateway."
  type        = string
  default     = ""
}

variable "source_vswitch_ids" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The vswitch ids. The length should be equal to snat_count."
  type        = list(string)
  default     = []
}


variable "source_cidrs" {
  description = "The private network segment of Ecs. The length should be equal to snat_count."
  type        = list(string)
  default     = []
}

variable "snat_ips" {
  description = "(Deprecated) It has been deprecated from 1.2.0. The snat ips of the nat gateway. The length should be equal to snat_count."
  type        = list(string)
  default     = []
}

