Alibaba Cloud Nat Gateway Terraform Module   
terraform-alicloud-nat-gateway
=============================

This Module used to create a new [Nat Gateway](https://www.alibabacloud.com/help/doc-detail/32322.htm) within VPC on Alibaba Cloud.

As an Internet gateway, a NAT Gateway requires public IP addresses to function. After creating a NAT Gateway, this module supports to create and associate one or more Elastic IP Addresses (EIPs) with the NAT Gateway.

These types of resources are supported:

* [Alicloud_nat_gateway](https://www.terraform.io/docs/providers/alicloud/r/nat_gateway.html)
* [Alicloud_eip](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [Alicloud_eip_association](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)

## Terraform versions

For Terraform 0.12.

## Usage
    
Create a new Nat Gateway and bind two EIPs.

```hcl
module "nat-gateway" {
  source = "terraform-alicloud-modules/nat-gateway/alicloud"
  region = var.region

  create = true
  vpc_id = "vpc-123435"
  name   = "nat-gateway-foo"

  // Create eip and bind them with nat gateway
  create_eip    = true
  number_of_eip = 2
  eip_name      = "eip-nat-foo"
}
```

Set an existing nat gateway and bind two eip
```hcl
module "existing" {
  source = "terraform-alicloud-modules/nat-gateway/alicloud"
  region = var.region

  use_existing_nat_gateway = true
  existing_nat_gateway_id  = "nat-1232456"

  // Create eip and bind them with nat gateway
  create_eip    = true
  number_of_eip = 2
  eip_name      = "eip-nat-bar"
}
```

## Examples

* [Complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-nat-gateway/tree/master/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by He Guimin(@xiaozhu36, heguimin36@163.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
