terraform-alicloud-nat-gateway
==============================

本 Module 用于在阿里云 VPC 下创建一个[Nat网关](https://www.alibabacloud.com/help/zh/doc-detail/32322.htm)。

NAT网关作为一个网关设备，需要绑定公网IP才能正常工作。创建NAT网关后，本 Module 还支持为该 NAT 网关创建并绑定弹性公网IP（EIP）。

本 Module 支持创建以下资源:

* [Nat 网关](https://www.terraform.io/docs/providers/alicloud/r/nat_gateway.html)
* [EIP 实例](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [EIP 绑定](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0

## 用法

创建一个新的 Nat 网关并为其绑定两个 EIP。

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

指定一个存量的 Nat 网关，并未其增加两个 EIP。
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

## 示例

* [完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-nat-gateway/tree/master/examples/complete)

## 注意事项
本Module从版本v1.3.0开始已经移除掉如下的 provider 的显示设置：
```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/nat-gateway"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.2.0:

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
如果你想对正在使用中的Module升级到 1.3.0 或者更高的版本，那么你可以在模板中显示定义一个相同Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显示指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

提交问题
-------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


