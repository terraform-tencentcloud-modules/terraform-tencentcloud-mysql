output "account_ids" {
  description = "Account name which is created in this module.If not created,returns null"
  value       = module.privilege.account_ids
}

output "account_privilege_ids" {
  description = "The number of created resource tencentcloud_mysql_account_privilege"
  value       = module.privilege.account_privilege_ids
}

output "mysql_privilege_ids" {
  description = ""
  value       = module.privilege.mysql_privilege_ids
}
