#################
# Provider
#################
variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

##############################################################
#variables for nat gateway
##############################################################
variable "create" {
  description = "Whether to create nat gateway. If false, you can specify an existing nat gateway by setting 'nat_gateway_id'."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "ID of the VPC where to create nat gateway."
  type        = string
  default     = ""
}

variable "name" {
  description = "Name of a new nat gateway."
  type        = string
  default     = "terraform-alicloud-nat-gateway"
}

variable "use_existing_nat_gateway" {
  description = "Whether to create nat gateway. If false, you can specify an existing nat gateway by setting 'nat_gateway_id'."
  type        = bool
  default     = false
}

variable "existing_nat_gateway_id" {
  description = "The id of an existing nat gateway."
  type        = string
  default     = ""
}

variable "specification" {
  description = "The specification of nat gateway."
  type        = string
  default     = "Small"
}

variable "instance_charge_type" {
  description = "The charge type of the nat gateway. Choices are 'PostPaid' and 'PrePaid'."
  type        = string
  default     = "PostPaid"
}

variable "period" {
  description = "The charge duration of the PrePaid nat gateway, in month."
  type        = number
  default     = 1
}

variable "nat_type" {
  description = "The type of nat gateway. Valid values: [Normal, Enhanced]."
  type        = string
  default     = "Normal"
}

variable "description" {
  description = "The description of nat gateway."
  type        = string
  default     = "A nat gateway create by terraform module terraform-alicloud-nat-gateway"
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
  type        = string
  default     = ""
}
variable "eip_name" {
  description = "Name to be used on all eip as prefix. Default to 'TF-EIP-for-Nat'. The final default name would be TF-EIP-for-Nat001, TF-EIP-for-Nat002 and so on."
  default     = "TF-EIP-for-Nat"
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
  default     = ""
}

########################
# Deprecated parameters
########################
variable "vswitch_cidrs" {
  description = "(Deprecated) It has been deprecated from 1.2.0. List of cidr blocks used to launch several new vswitches."
  type        = list(string)
  default     = []
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
  type        = list(string)
  description = "(Deprecated) It has been deprecated from 1.2.0. The external ip id of dnat entry. The length should be equal to dnat_count."
  default     = []
}

variable "internal_ips" {
  type        = list(string)
  description = "(Deprecated) It has been deprecated from 1.2.0. The internal ip of dnat entry. The length should be equal to dnat_count."
  default     = []
}

variable "external_ports" {
  type        = list(string)
  description = "(Deprecated) It has been deprecated from 1.2.0. The external port of dnat entry. The length should be equal to dnat_count."
  default     = []
}

variable "internal_ports" {
  type        = list(string)
  description = "(Deprecated) It has been deprecated from 1.2.0. The internal port of dnat entry. The length should be equal to dnat_count."
  default     = []
}

variable "ip_protocols" {
  type        = list(string)
  description = "(Deprecated) It has been deprecated from 1.2.0. The ip protocols of dnat entry. The length should be equal to dnat_count."
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
  type        = list(string)
  description = "(Deprecated) It has been deprecated from 1.2.0. The vswitch ids. The length should be equal to snat_count."
  default     = []
}

variable "snat_ips" {
  type        = list(string)
  description = "(Deprecated) It has been deprecated from 1.2.0. The snat ips of the nat gateway. The length should be equal to snat_count."
  default     = []
}

