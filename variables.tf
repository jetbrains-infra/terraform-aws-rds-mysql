variable "name" {
  description = "A unique name of RDS instance"
}
variable "disk_size" {
  description = "The allocated storage in gigabytes."
  default     = "20"
}
variable "db_subnets" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
}
variable "password" {
  description = "Password for the master DB user. Leave empty to generate."
  default     = ""
}
variable "username" {
  description = "Username for the master DB user. Leave empty to generate."
  default     = ""
}
variable "database" {
  description = "The name of the database to create when the DB instance is created."
  default     = ""
}
variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}
variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible. Default is false."
  default     = false
}
variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = 3
}
variable "enable_audit_log" {
  description = "Enable audit log."
  default     = false
}
variable "enable_error_log" {
  description = "Enable error log."
  default     = true
}
variable "enable_general_log" {
  description = "Enable general log."
  default     = true
}
variable "enable_slowquery_log" {
  description = "Enable slowquery log."
  default     = true
}
variable "enhanced_monitoring_interval" {
  description = "Enable Enhanced Monitoring by specifying its interval. Allowed values are 0, 1, 5, 10, 15, 30, 60."
  default     = 0
}
variable "performance_insights_enabled" {
  description = "Enable Performance Insights."
  default     = false
}
variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
  default     = "05:00-07:00"
}
variable "trusted_cidr_blocks" {
  description = "A list of trusted external IP. You may specify office IPs f.e. Of course, RDS should be public accessible."
  type        = list(string)
  default     = []
}
variable "instance_type" {
  description = "The instance type of the RDS instance"
  default     = "db.t2.small"
}
data "aws_subnet" "default" {
  id = var.db_subnets[0]
}
variable "engine_version" {
  description = "MySQL version. Default is 8.0"
  default     = 8.0
}
variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  default     = true
}
variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate."
  default     = ""
}
variable "tags" {
  description = "Tags."
  type        = map(string)
}
variable "parameter_prefix" {
  description = "Prefix for module params to store in SSM Parameter Store."
  default     = ""
}
variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  default     = false
}

locals {
  name                    = var.name
  id                      = lower(replace(var.name, " ", "-"))
  subnet_group_name       = lower(replace(var.name, " ", "-"))
  username                = var.username == "" ? random_pet.username.id : var.username
  password                = var.password == "" ? random_password.password.result : var.password
  database                = var.database == "" ? random_pet.db_name.id : var.database
  parameter_group_name    = var.parameter_group_name
  rds_with_param_group    = local.parameter_group_name == "" ? 0 : 1
  rds_without_param_group = local.parameter_group_name == "" ? 1 : 0
  parameter_prefix        = var.parameter_prefix == "" ? "" : "${var.parameter_prefix}/${local.id}"
  store_parameters        = var.parameter_prefix == "" ? 0 : 1
  instance_type           = var.instance_type
  engine_version          = var.engine_version
  family                  = "mysql${var.engine_version}"
  disk_size               = var.disk_size
  multi_az                = var.multi_az
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period
  publicly_accessible     = var.publicly_accessible
  apply_immediately       = var.apply_immediately
  deletion_protection     = var.deletion_protection
  trusted_cidr_blocks     = var.trusted_cidr_blocks
  db_subnets              = var.db_subnets
  vpc_id                  = data.aws_subnet.default.vpc_id
  address                 = local.parameter_group_name == "" ? join("", aws_db_instance.default.*.address) : join("", aws_db_instance.parameterized.*.address)
  hosted_zone_id          = local.parameter_group_name == "" ? join("", aws_db_instance.default.*.hosted_zone_id) : join("", aws_db_instance.parameterized.*.hosted_zone_id)
  rds_id                  = local.parameter_group_name == "" ? join("", aws_db_instance.default.*.id) : join("", aws_db_instance.parameterized.*.id)
  logs_set = compact([
    var.enable_audit_log ? "audit" : "",
    var.enable_error_log ? "error" : "",
    var.enable_general_log ? "general" : "",
    var.enable_slowquery_log ? "slowquery" : "",
  ])
  enhanced_monitoring_interval = var.enhanced_monitoring_interval
  performance_insights_enabled = var.performance_insights_enabled
  tags = merge({
    Name          = var.name,
    Module        = "RDS MySQL"
    ModuleVersion = "v0.4.0"
    ModuleSource  = "https://github.com/jetbrains-infra/terraform-aws-rds-mysql"
  }, var.tags)
}