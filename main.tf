resource "tencentcloud_mysql_instance" "this" {
  count = var.instance_id == "" ? 1 : 0

  instance_name     = var.instance_name
  root_password     = var.root_password
  mem_size          = var.mem_size
  volume_size       = var.volume_size
  tags              = var.tags
  availability_zone = local.availability_zone
  engine_version    = var.engine_version
  project_id        = var.project_id
  security_groups   = var.security_groups
  parameters        = var.parameters

  # payment configuration

  charge_type     = var.charge_type
  prepaid_period  = var.prepaid_period
  auto_renew_flag = var.auto_renew_flag
  force_delete    = var.force_delete

  # network configuration

  internet_service = var.internet_service
  intranet_port    = var.intranet_port
  subnet_id        = var.subnet_id
  vpc_id           = var.vpc_id

  # slave configuration

  first_slave_zone  = var.first_slave_zone
  second_slave_zone = var.second_slave_zone
  slave_deploy_mode = var.slave_deploy_mode
  slave_sync_mode   = var.slave_sync_mode
}

resource "tencentcloud_mysql_account" "this" {
  count = local.account_number

  mysql_id    = var.instance_id == "" ? tencentcloud_mysql_instance.this.0.id : var.instance_id
  name        = var.account[count.index].account_name
  password    = var.account[count.index].account_password
  description = lookup(var.account[count.index], "account_description", "default description")
  host        = lookup(var.account[count.index], "account_host", "%")
}

resource "tencentcloud_mysql_account_privilege" "this" {
  count = local.account_privilege_number

  account_name   = var.account_privilege[count.index].account_name
  database_names = var.account_privilege[count.index].database_names
  mysql_id       = var.instance_id == "" ? tencentcloud_mysql_instance.this.0.id : var.instance_id
  account_host   = lookup(var.account_privilege[count.index], "account_host", "%")
  privileges     = lookup(var.account_privilege[count.index], "privileges", [])
  depends_on = [
    tencentcloud_mysql_account.this,
  ]
}

resource "tencentcloud_mysql_privilege" "this" {
  count = local.mysql_privilege_number

  account_name = var.mysql_privilege[count.index].account_name
  global       = var.mysql_privilege[count.index].global
  mysql_id     = var.instance_id == "" ? tencentcloud_mysql_instance.this.0.id : var.instance_id
  account_host = lookup(var.mysql_privilege[count.index], "account_host", "%")
  dynamic "column" {
    for_each = lookup(var.mysql_privilege[count.index], "column", [])
    content {
      column_name   = column.value["column_name"]
      table_name    = column.value["table_name"]
      database_name = column.value["database_name"]
      privileges    = column.value["privileges"]
    }
  }

  dynamic "database" {
    for_each = lookup(var.mysql_privilege[count.index], "database", [])
    content {
      database_name = database.value["database_name"]
      privileges    = database.value["privileges"]
    }
  }

  dynamic "table" {
    for_each = lookup(var.mysql_privilege[count.index], "table", [])
    content {
      database_name = table.value["database_name"]
      table_name    = table.value["table_name"]
      privileges    = table.value["privileges"]
    }
  }
  depends_on = [
    tencentcloud_mysql_account.this,
  ]
}

resource "tencentcloud_mysql_backup_policy" "this" {
  count = var.instance_id == "" ? 1 : 0

  mysql_id         = var.instance_id == "" ? tencentcloud_mysql_instance.this.0.id : var.instance_id
  backup_model     = var.backup_model
  backup_time      = var.backup_time
  retention_period = var.retention_period
}


resource "tencentcloud_mysql_readonly_instance" "this" {
  count = local.readonly_instance_number

  instance_name      = var.instance_id == "" ? format("%s-readonly%s", var.instance_name, count.index) : format("%s_readonly", var.readonly_instances[count.index].instance_name)
  master_instance_id = var.instance_id == "" ? tencentcloud_mysql_instance.this.0.id : var.instance_id
  mem_size           = lookup(var.readonly_instances[count.index], "mem_size", var.mem_size)
  volume_size        = lookup(var.readonly_instances[count.index], "volume_size", var.volume_size)
  auto_renew_flag    = lookup(var.readonly_instances[count.index], "auto_renew_flag", var.auto_renew_flag)
  charge_type        = lookup(var.readonly_instances[count.index], "charge_type", var.charge_type)
  force_delete       = lookup(var.readonly_instances[count.index], "force_delete", var.force_delete)
  intranet_port      = lookup(var.readonly_instances[count.index], "intranet_port", var.intranet_port)
  prepaid_period     = lookup(var.readonly_instances[count.index], "prepaid_period", var.prepaid_period)
  security_groups    = lookup(var.readonly_instances[count.index], "security_groups", var.security_groups)
  subnet_id          = lookup(var.readonly_instances[count.index], "subnet_id", var.subnet_id)
  vpc_id             = lookup(var.readonly_instances[count.index], "vpc_id", var.vpc_id)
  tags               = lookup(var.readonly_instances[count.index], "tags", var.tags)
}
