Alicloud Nat Gateway Terraform Module
terraform-alicloud-nat-gateway
=====================================================================
 A terraform module to provide nat gateway architecture in alibaba cloud.
 These types of the module resource are supported:
 - [VPC](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
- [Subnet](https://www.terraform.io/docs/providers/alicloud/r/vswitch.html)
- [Load Balancer](https://www.terraform.io/docs/providers/alicloud/r/slb.html)
- [ECS Instance](https://www.terraform.io/docs/providers/alicloud/r/instance.html)
- [Security Group](https://www.terraform.io/docs/providers/alicloud/r/security_group.html)
- [RDS Instance](https://www.terraform.io/docs/providers/alicloud/r/db_instance.html)
- [RDS Account](https://www.terraform.io/docs/providers/alicloud/r/db_account.html)
- [RDS Database](https://www.terraform.io/docs/providers/alicloud/r/db_database.html)
- [OSS Bucket](https://www.terraform.io/docs/providers/alicloud/r/oss_bucket.html)
 ----------------------
 Usage
-----
You can use this in your terraform template with the following steps.
 1. Adding a module resource to your template, e.g. main.tf
     ```
    module "nat-gateway" {
        source = "aliyun/nat-gateway/alicloud"
         vpc_name = "my-new-vpc"
        vswitch_cidrs = ["10.1.2.0/24", "10.1.3.0/24"]
    }
    ```
 2. Setting `access_key` and `secret_key` values through environment variables:
     - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
 Conditional creation
--------------------
This example supports using existing VPC and VSwitches to create nat gateway conditionally.
 #### Using existing vpc and vswitches for the cluster.
 You can specify the following user-defined arguments:
 * vpc_id: An existing vpc ID
* vswitch_ids: List of IDs for several existing vswitches
 Terraform version
-----------------
Terraform version 0.11.0 or newer is required for this module to work.
 Authors
-------
Created and maintained by Ce Jin(@dianmuali, jince567@163.com)
 License
-------
Mozilla Public License 2.0. See LICENSE for full details.
 Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/)