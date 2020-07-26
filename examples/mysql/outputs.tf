output "cdb_id" {
  description = ""
  value       = module.mysql.cdb_id
}

output "gtid" {
  description = ""
  value       = module.mysql.gtid
}

output "internet_host" {
  description = ""
  value       = module.mysql.internet_host
}

output "internet_port" {
  description = ""
  value       = module.mysql.internet_port
}

output "intranet_ip" {
  description = ""
  value       = module.mysql.intranet_ip
}

output "locked" {
  description = ""
  value       = module.mysql.locked
}

output "status" {
  description = ""
  value       = module.mysql.status
}

output "task_status" {
  description = ""
  value       = module.mysql.task_status
}

output "binlog_period" {
  description = ""
  value       = module.mysql.binlog_period
}

output "mysql_readonly_instance_ids" {
  description = ""
  value       = module.mysql.mysql_readonly_instance_ids
}
