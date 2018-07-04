variable "name" {
  description = "A unique name of RDS instance"
}

variable "disk_size" {
  description = "The allocated storage in gibibytes."
  default     = "20"
}

variable "db_subnets" {
  description = "A list of VPC subnet IDs"
  type        = "list"
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

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
  default     = "05:00-07:00"
}

variable "trusted_cidr_blocks" {
  description = "A list of trusted external IP. You may specify office IPs f.e. Of course, RDS should be public accessible."
  type        = "list"
  default     = []
}

variable "instance_type" {
  description = "The instance type of the RDS instance"
  default     = "db.t2.small"
}

data "aws_subnet" "default" {
  id = "${var.db_subnets[0]}"
}

locals {
  vpc_id = "${data.aws_subnet.default.vpc_id}"
}

variable "version" {
  description = "MySQL version. Default is 5.7"
  default     = "5.7"
}

locals {
  family = "mysql${var.version}"
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  default     = true
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate."
  default     = ""
}