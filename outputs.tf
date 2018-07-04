output "password" {
  sensitive   = true
  description = "RDS master password"
  value       = "${var.password == "" ? local.password : var.password}"
}

output "username" {
  description = "DB master user name"
  value       = "${var.username == "" ? local.username : var.username}"
}

output "address" {
  description = "The address of the RDS instance."
  value       = "${var.parameter_group_name == "" ? join("", aws_db_instance.default.*.address) : join("", aws_db_instance.parameterized.*.address)}"
}

output "database" {
  description = "The database name."
  value       = "${var.database == "" ? local.database : var.database}"
}

output "hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = "${var.parameter_group_name == "" ? join("", aws_db_instance.default.*.hosted_zone_id) : join("", aws_db_instance.parameterized.*.hosted_zone_id)}"
}

output "rds_id" {
  description = "The RDS instance ID"
  value       = "${var.parameter_group_name == "" ? join("", aws_db_instance.default.*.id) : join("", aws_db_instance.parameterized.*.id)}"
}