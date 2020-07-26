data "tencentcloud_vpc_instances" "default" {
  name = "Default-VPC"
}

data "tencentcloud_vpc_subnets" "default" {
  availability_zone = local.availability_zone
  vpc_id            = data.tencentcloud_vpc_instances.default.instance_list.0.vpc_id
}

resource "tencentcloud_security_group" "default" {
  name        = "mysql-security-group"
  description = "security group for mysql."
  project_id  = 0
}

module "mysql" {
  source = "../../"

  instance_name     = var.instance_name
  tags              = var.tags
  engine_version    = "5.7"
  root_password     = var.root_password
  mem_size          = local.mem_size
  volume_size       = local.volume_size
  availability_zone = local.availability_zone
  project_id        = var.project_id
  security_groups   = var.security_groups == [] ? [tencentcloud_security_group.default.id] : var.security_groups
  parameters        = var.parameters

  # payment configuration

  charge_type     = var.charge_type
  prepaid_period  = var.prepaid_period
  auto_renew_flag = var.auto_renew_flag
  force_delete    = var.force_delete

  # network configuration

  internet_service = var.internet_service
  intranet_port    = var.intranet_port
  vpc_id           = var.vpc_id == "" ? data.tencentcloud_vpc_instances.default.instance_list.0.vpc_id : var.vpc_id
  subnet_id        = var.subnet_id == "" ? data.tencentcloud_vpc_subnets.default.instance_list.0.subnet_id : var.subnet_id

  # slave configuration

  first_slave_zone  = var.first_slave_zone
  slave_deploy_mode = var.slave_deploy_mode
  slave_sync_mode   = var.slave_sync_mode

  # readonly instance

  readonly_instances = [
    {
      tags = var.tags
    }
  ]
}
