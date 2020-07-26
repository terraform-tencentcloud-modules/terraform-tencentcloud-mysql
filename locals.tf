locals {
  availability_zone        = var.availability_zone != "" ? var.availability_zone : "ap-guangzhou-2"
  account_number           = var.instance_id == "" ? 0 : length(var.account)
  account_privilege_number = var.instance_id != "" ? length(var.account_privilege) : 0
  mysql_privilege_number   = var.instance_id != "" ? length(var.mysql_privilege) : 0
  readonly_instance_number = var.instance_id != "" ? length(var.readonly_instances) : 0
}
