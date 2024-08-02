output "password" {
  sensitive   = true
  description = "RDS master password"
  value       = local.password
}

output "username" {
  description = "DB master user name"
  value       = local.username
}

output "address" {
  description = "The address of the RDS instance."
  value       = local.address
}

output "database" {
  description = "The database name."
  value       = local.database
}

output "hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = local.hosted_zone_id
}

output "rds_id" {
  /*
     Deprecated:
     Since aws provider v5.0.0 `aws_db_instance.id` returns resource id instead of instance id.
     Consider to use `rds_identifier` or `rds_arn` instead.
     For the details see https://github.com/hashicorp/terraform-provider-aws/pull/31232.
   */
  description = "RDS Resource ID (for aws provider >= v5.0.0) or instance id (for aws provider < v5.0.0)."
  value       = local.resource_id
}

output "rds_resource_id" {
  description = "RDS Resource ID"
  value       = local.resource_id
}

output "rds_arn" {
  description = "The RDS ARN"
  value       = local.arn
}

output "rds_identifier" {
  description = "The RDS instance ID"
  value       = local.identifier
}