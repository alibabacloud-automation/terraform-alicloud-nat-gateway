variable "snat_count" {
  description = "Number of snat entry."
  type        = number
  default     = 1
}

variable "snat_table_id" {
  description = "The snat table id of nat gateway."
  type        = string
  default     = ""
}

variable "source_vswitch_ids" {
  description = "The vswitch ids. The length should be equal to snat_count."
  type        = list(string)
  default     = []
}

variable "snat_ips" {
  description = "The snat ips of the nat gateway. The length should be equal to snat_count."
  type        = list(string)
  default     = []
}