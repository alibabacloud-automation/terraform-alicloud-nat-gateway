terraform-alicloud-nat-gateway
==============================

本 Module 用于在阿里云 VPC 下创建一个[Nat网关](https://www.alibabacloud.com/help/zh/doc-detail/32322.htm)。

NAT网关作为一个网关设备，需要绑定公网IP才能正常工作。创建NAT网关后，本 Module 还支持为该 NAT 网关创建并绑定弹性公网IP（EIP）。

本 Module 支持创建以下资源:

* [Nat 网关](https://www.terraform.io/docs/providers/alicloud/r/nat_gateway.html)
* [EIP 实例](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [EIP 绑定](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)

## Terraform 版本

如果您正在使用 Terraform 0.12.

## 用法

创建一个新的 Nat 网关并为其绑定两个 EIP。

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

指定一个存量的 Nat 网关，并未其增加两个 EIP。
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

## 示例

* [完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-nat-gateway/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

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


