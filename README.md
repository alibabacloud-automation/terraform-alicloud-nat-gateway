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

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0

## Usage
    
Create a new Nat Gateway and bind two EIPs.

```hcl
module "nat-gateway" {
  source = "terraform-alicloud-modules/nat-gateway/alicloud"

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
From the version v1.3.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/nat-gateway"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.2.0:

```hcl
module "nat-gateway" {
  source = "terraform-alicloud-modules/nat-gateway/alicloud"
  version     = "1.2.0"
  region      = "cn-hangzhou"
  profile     = "Your-Profile-Name"

  create_eip    = true
  number_of_eip = 2
  eip_name      = "eip-nat-bar"
}
```

If you want to upgrade the module to 1.3.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
   region  = "cn-hangzhou"
   profile = "Your-Profile-Name"
}
module "nat-gateway" {
  source = "terraform-alicloud-modules/nat-gateway/alicloud"
  create_eip    = true
  number_of_eip = 2
  eip_name      = "eip-nat-bar"
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
  alias   = "hz"
}
module "nat-gateway" {
  source = "terraform-alicloud-modules/nat-gateway/alicloud"
  providers = {
    alicloud = alicloud.hz
  }
  create_eip    = true
  number_of_eip = 2
  eip_name      = "eip-nat-bar"
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.
More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
