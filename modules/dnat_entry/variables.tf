variable "dnat_count" {
  description = "Number of dnat entry."
  type        = number
  default     = 1
}

variable "forward_table_id" {
  description = "The forward table id of dnat entry."
  type        = string
  default     = ""
}

variable "external_ips" {
  description = "The external ip id of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "internal_ips" {
  description = "The internal ip of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "external_ports" {
  description = "The external port of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "internal_ports" {
  description = "The internal port of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}

variable "ip_protocols" {
  description = "The ip protocols of dnat entry. The length should be equal to dnat_count."
  type        = list(string)
  default     = []
}