variable "instance_name" {
  description = "The name of a mysql instance."
  type        = string
  default     = ""
}

variable "instance_id" {
  description = "The id of a mysql instance."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Instance tags."
  type        = map(string)
  default     = {}
}

##########
# cdb conventional configurations
##########

variable "engine_version" {
  description = "The version number of the database engine to use. Supported versions include 5.5/5.6/5.7, and default is 5.7."
  default     = "5.7"
}

variable "root_password" {
  description = "Password of root account. This parameter can be specified when you purchase master instances, but it should be ignored when you purchase read-only instances or disaster recovery instances."
  default     = "password"
}

variable "region" {
  description = "TencentCloud region to launch resources."
  default     = ""
}

variable "mem_size" {
  description = "Memory size (in MB)."
  default     = 1000
}

variable "volume_size" {
  description = "Disk size (in GB)."
  default     = 200
}

variable "availability_zone" {
  description = "Indicates which availability zone will be used."
  default     = ""
}

variable "project_id" {
  description = "Project ID, default value is 0."
  default     = 0
}

variable "security_groups" {
  description = "Security groups to use."
  type        = list(string)
  default     = []
}

variable "parameters" {
  description = "List of parameters to use."
  type        = map(string)
  default     = {}
}

##########
# net configuration
##########

variable "internet_service" {
  description = "Indicates whether to enable the access to an instance from public network: 0 - No, 1 - Yes."
  default     = 0
}

variable "intranet_port" {
  description = "Public access port, rang form 1024 to 65535 and default value is 3306."
  default     = 3306
}

variable "vpc_id" {
  description = "ID of VPC, which can be modified once every 24 hours and can't be removed."
  default     = ""
}

variable "subnet_id" {
  description = "Private network ID. If vpc_id is set, this value is required."
  default     = ""
}

##########
# payment configuration
##########

variable "charge_type" {
  description = "Pay type of instance, valid values are PREPAID, POSTPAID. Default is POSTPAID."
  default     = "POSTPAID"
}

variable "prepaid_period" {
  description = "Period of instance. NOTES: Only supported prepaid instance."
  default     = 1
}

variable "auto_renew_flag" {
  description = "Auto renew flag. NOTES: Only supported prepaid instance."
  default     = 0
}

variable "force_delete" {
  description = "Indicate whether to delete instance directly or not. Default is false. If set true, the instance will be deleted instead of staying recycle bin. Note: only works for PREPAID instance. When the main mysql instance set true, this para of the readonly mysql instance will not take effect."
  default     = false
}

##########
# slave configuration
##########

variable "first_slave_zone" {
  description = "Zone information about first slave instance."
  type        = string
  default     = ""
}

variable "second_slave_zone" {
  description = "Zone information about second slave instance."
  type        = string
  default     = ""
}

variable "slave_deploy_mode" {
  description = "Availability zone deployment method. Available values: 0 - Single availability zone; 1 - Multiple availability zones."
  default     = 0
}

variable "slave_sync_mode" {
  description = "Data replication mode. 0 - Async replication; 1 - Semisync replication; 2 - Strongsync replication."
  default     = 0
}

##########
# readonly instance
##########

variable "readonly_instances" {
  description = "Multiple readonly instances.Every element of the list contains a tencentcloud_mysql_readonly_instance configuration object.See https://www.terraform.io/docs/providers/tencentcloud/r/mysql_readonly_instance.html for configuration guide."
  default     = []
}

##########
# backup policy
##########

variable "backup_model" {
  description = "Backup method. Supported values include: 'physical' - physical backup."
  type        = string
  default     = "physical"
}

variable "backup_time" {
  description = " Instance backup time, in the format of \"HH:mm-HH:mm\". Time setting interval is four hours. Default to \"02:00-06:00\". The following value can be supported: 02:00-06:00, 06:00-10:00, 10:00-14:00, 14:00-18:00, 18:00-22:00, and 22:00-02:00."
  type        = string
  default     = "02:00-06:00"
}

variable "retention_period" {
  description = " Instance backup retention days. Valid values: [7-730]. And default value is 7."
  default     = 7
}

##########
# account configuration
##########

variable "account" {
  description = "Multiple account instances.Every element of the list contains a tencentcloud_mysql_account configuration object.See https://www.terraform.io/docs/providers/tencentcloud/r/mysql_account.html for configuration guide."
  default     = []
}

variable "account_privilege" {
  description = "Multiple account privilege configuration instances.Every element of the list contains a tencentcloud_mysql_account_privilege configuration object.See https://www.terraform.io/docs/providers/tencentcloud/r/mysql_account_privilege.html for configuration guide."
  default     = []
}

##########
# database privilege
##########

variable "mysql_privilege" {
  description = "Multiple privilege configuration instances.Every element of the list contains a tencentcloud_mysql_privilege configuration object.See https://www.terraform.io/docs/providers/tencentcloud/r/mysql_privilege.html for configuration guide."
  default     = []
}
