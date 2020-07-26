# MySQL Module Example

This module will create a new MySQL account and set privileges for existing database.

## Usage

To run this example, you need first replace the configuration like `account`, `mysql_privilege` etc, and then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| account_ids | Account id list which returned by the account resource created.If not created,returns `[]`. |
| account_privilege_ids | The id list of created resource tencentcloud_mysql_account_privilege. |
| mysql_privilege_ids | The id list of created resource tencentcloud_mysql_privilege. |