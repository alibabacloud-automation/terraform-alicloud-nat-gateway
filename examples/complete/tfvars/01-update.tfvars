#variables for nat gateway
name          = "update-tf-nat-gateway-name"
specification = "Middle"
description   = "update-tf-description"
period        = 2

# New EIP parameters
eip_bandwidth = 10
eip_period    = 2
eip_tags = {
  Name = "updateEIP"
}

#variables for alicloud_dnat_entry
external_ports = [90]
ip_protocols   = ["udp"]
internal_ips   = ["172.16.0.6"]
internal_ports = [9090]