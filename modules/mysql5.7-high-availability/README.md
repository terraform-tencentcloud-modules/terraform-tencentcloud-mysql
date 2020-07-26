# TencentCloud [MODIFY !!!] Module for Terraform

## terraform-tencentcloud-vpc

A terraform module used to create TencentCloud MySQL 5.7 instance with one readonly instance.

The following resources are included.

* [MySQL](https://www.terraform.io/docs/providers/tencentcloud/r/mysql_instance.html)
* [MySQL Account](https://www.terraform.io/docs/providers/tencentcloud/r/mysql_account.html)
* [MySQL Account Privilege](https://www.terraform.io/docs/providers/tencentcloud/r/mysql_account_privilege.html)
* [MySQL Backup Policy](https://www.terraform.io/docs/providers/tencentcloud/r/mysql_backup_policy.html)
* [MySQL Privilege](https://www.terraform.io/docs/providers/tencentcloud/r/mysql_privilege.html)
* [MySQL Readonly Instance](https://www.terraform.io/docs/providers/tencentcloud/r/mysql_readonly_instance.html)

## Usage

```hcl
module "mysql" {
    source = "terraform-tencentcloud-modules/mysql/tencentcloud/mysql5.7-high-availability"

    instance_name = "simple-mysql"
    root_password = "your_passwd1"
    availability_zone = "ap-guangzhou-2"

    tags = {
        Env = "dev"
    }
}
```

## Conditional Creation



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| root_password | Password of root account. This parameter can be specified when you purchase master instances, but it should be ignored when you purchase read-only instances or disaster recovery instances. | string |  | no 
| project_id | Project ID, default value is 0. | string | 0 | no 
| vpc_id | ID of VPC, which can be modified once every 24 hours and can't be removed. | string |  | no 
| slave_deploy_mode | Availability zone deployment method. Available values: 0 - Single availability zone; 1 - Multiple availability zones. | string | 0 | no 
| tags | Instance tags. | map | {} | no 
| mem_size | Memory size (in MB). | string | 1000 | no 
| parameters | List of parameters to use. | map | {} | no 
| internet_service | Indicates whether to enable the access to an instance from public network: 0 - No, 1 - Yes. | string | 0 | no 
| first_slave_zone | Zone information about first slave instance. | string |  | no 
| prepaid_period | Period of instance. NOTES: Only supported prepaid instance. | string | 1 | no 
| auto_renew_flag | Auto renew flag. NOTES: Only supported prepaid instance. | string | 0 | no 
| force_delete | Indicate whether to delete instance directly or not. Default is false. If set true, the instance will be deleted instead of staying recycle bin. Note: only works for PREPAID instance. When the main mysql instance set true, this para of the readonly mysql instance will not take effect. | bool | false | no 
| instance_name | The name of a mysql instance. | string |  | no 
| volume_size | Disk size (in GB). | string | 200 | no 
| intranet_port | Public access port, rang form 1024 to 65535 and default value is 3306. | string | 3306 | no 
| subnet_id | Private network ID. If vpc_id is set, this value is required. | string |  | no 
| slave_sync_mode | Data replication mode. 0 - Async replication; 1 - Semisync replication; 2 - Strongsync replication. | string | 0 | no 
| charge_type | Pay type of instance, valid values are PREPAID, POSTPAID. Default is POSTPAID. | string | POSTPAID | no 
| region | TencentCloud region to launch resources. | string |  | no 
| availability_zone | Indicates which availability zone will be used. | string |  | no 
| security_groups | Security groups to use. | list | [] | no 


## Outputs

| Name | Description |
|------|-------------|
| locked | Indicates whether the instance is locked. 0 - No; 1 - Yes. |
| binlog_period | Retention period for binlog in days. |
| account_ids | Account id list which returned by the account resource created.If not created,returns `[]`. |
| account_privilege_ids | The id list of created resource tencentcloud_mysql_account_privilege. |
| cdb_id | The id of cdb. |
| gtid | Is GTID activated. |
| internet_host | Host for public access. |
| internet_port | Access port for public access. |
| intranet_ip | instance intranet IP. |
| status | Instance status. Available values: 0 - Creating; 1 - Running; 4 - Isolating; 5 - Isolated. |
| task_status | Indicates which kind of operations is being executed. |
| mysql_privilege_ids | The id list of created resource tencentcloud_mysql_privilege. |
| mysql_readonly_instance_ids |  |


## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.