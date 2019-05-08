output "password" {
  sensitive   = true
  description = "RDS master password"
  value       = "${local.password}"
}

output "username" {
  description = "DB master user name"
  value       = "${local.username}"
}

output "address" {
  description = "The address of the RDS instance."
  value       = "${local.address}"
}

output "database" {
  description = "The database name."
  value       = "${local.database}"
}

output "hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = "${local.hosted_zone_id}"
}

output "rds_id" {
  description = "The RDS instance ID"
  value       = "${local.rds_id}"
}