#variables for nat gateway
variable "name" {
  description = "Name of a new nat gateway."
  type        = string
  default     = "tf-nat-gateway-name"
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
  default     = "tf-description"
}

variable "period" {
  description = "The charge duration of the PrePaid nat gateway, in month."
  type        = number
  default     = 1
}

# New EIP parameters
variable "eip_bandwidth" {
  description = "Maximum bandwidth to the elastic public network, measured in Mbps (Mega bit per second)."
  type        = number
  default     = 5
}

variable "eip_period" {
  description = "The duration that you will buy the EIP, in month."
  type        = number
  default     = 1
}

variable "eip_tags" {
  description = "A mapping of tags to assign to the EIP instance resource."
  type        = map(string)
  default = {
    Name = "EIP"
  }
}

#variables for alicloud_dnat_entry
variable "external_ports" {
  description = "The external port of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = [80]
}

variable "ip_protocols" {
  description = "The ip protocols of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = ["tcp"]
}

variable "internal_ips" {
  description = "The internal ip of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = ["172.16.0.3"]
}

variable "internal_ports" {
  description = "The internal port of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = [8080]
}