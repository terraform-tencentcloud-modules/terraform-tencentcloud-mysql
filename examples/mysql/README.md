# MySQL Module Example

This module will create a new MySQL Instance.

## Usage

To run this example, you need first replace the configuration like `instance_name`, `availability_zone` etc, and then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| locked | Indicates whether the instance is locked. 0 - No; 1 - Yes. |
| binlog_period | Retention period for binlog in days. |
| cdb_id | The id of cdb. |
| gtid | Is GTID activated. |
| internet_host | Host for public access. |
| internet_port | Access port for public access. |
| intranet_ip | instance intranet IP. |
| status | Instance status. Available values: 0 - Creating; 1 - Running; 4 - Isolating; 5 - Isolated. |
| task_status | Indicates which kind of operations is being executed. |
| mysql_readonly_instance_ids |  |