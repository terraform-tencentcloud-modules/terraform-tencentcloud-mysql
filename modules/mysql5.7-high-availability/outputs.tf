output "cdb_id" {
  description = "The id of cdb."
  value       = module.mysql.cdb_id
}

output "gtid" {
  description = "Is GTID activated."
  value       = module.mysql.gtid
}

output "internet_host" {
  description = "Host for public access."
  value       = module.mysql.internet_host
}

output "internet_port" {
  description = "Access port for public access."
  value       = module.mysql.internet_port
}

output "intranet_ip" {
  description = "instance intranet IP."
  value       = module.mysql.intranet_ip
}

output "locked" {
  description = "Indicates whether the instance is locked. 0 - No; 1 - Yes."
  value       = module.mysql.locked
}

output "status" {
  description = "Instance status. Available values: 0 - Creating; 1 - Running; 4 - Isolating; 5 - Isolated."
  value       = module.mysql.status
}

output "task_status" {
  description = "Indicates which kind of operations is being executed."
  value       = module.mysql.task_status
}

output "binlog_period" {
  description = "Retention period for binlog in days."
  value       = module.mysql.binlog_period
}

output "account_ids" {
  description = "Account id list which returned by the account resource created.If not created,returns `[]`."
  value       = module.mysql.account_ids
}

output "account_privilege_ids" {
  description = "The id list of created resource tencentcloud_mysql_account_privilege."
  value       = module.mysql.account_privilege_ids
}

output "mysql_privilege_ids" {
  description = "The id list of created resource tencentcloud_mysql_privilege."
  value       = module.mysql.mysql_privilege_ids
}

output "mysql_readonly_instance_ids" {
  description = ""
  value       = module.mysql.mysql_readonly_instance_ids
}
