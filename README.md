## About
Terraform module to run RDS MySQL instance. 

### Params 
* `name` - A unique name of RDS instance.
* `tags` - A map of tags.
* `db_subnets`- A list of VPC subnet IDs.
* `trusted_cidr_blocks` - A list of trusted external IP. You may specify office IPs f.e. Of course, RDS should be public accessible.

### Parameter Store support
You may specify `parameter_prefix` and the module will store output values to the following parameters:
* `<parameter_prefix>/<id>/password`
* `<parameter_prefix>/<id>/username`
* `<parameter_prefix>/<id>/database`
* `<parameter_prefix>/<id>/address`
* `<parameter_prefix>/<id>/zone_id`
* `<parameter_prefix>/<id>/id`
* `<parameter_prefix>/<id>/security_group_id`


### Optional params with default values
* `disk_size` - The allocated storage in gibibytes. (Default is `20`)
* `password` - Password for the master DB user. Leave empty to generate (Optional)
* `username` - Username for the master DB user. Leave empty to generate (Optional)
* `database` - The name of the database to create when the DB instance is created (Optional)
* `multi_az` - Specifies if the RDS instance is multi-AZ (Optional)
* `publicly_accessible` - Bool to control if instance is publicly accessible (Default is `false`)
* `backup_retention_period` - The days to retain backups for (Default is `3`)
* `backup_window` - The daily time range (in UTC) during which automated backups are created if they are enabled (Default `05:00-07:00`)
* `instance_type` - The instance type of the RDS instance (Default is `db.t2.small`)
* `engine_version` - MySQL version (Default is `8.0`)
* `apply_immediately` - Specifies whether any database modifications are applied immediately, or during the next maintenance window (Default is `true`)
* `parameter_group_name` - Name of the DB parameter group to associate (Optional)
* `enable_audit_log` - Enable audit log (Default is `false`)
* `enable_error_log` - Enable error log (Default is `true`)
* `enable_general_log` - Enable general log (Default `true`)
* `enable_slowquery_log` - Enable slowquery log (Default `true`)

## Usage

Default RDS instances (`db.t2.small` type):
```hcl
module "example_rds" {
  source              = "github.com/jetbrains-infra/terraform-aws-rds-mysql?ref=v0.4.0"
  project             = "FooBar"
  name                = "example"
  db_subnets          = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]
  trusted_cidr_blocks = [
    aws_subnet.public_subnet_1.cidr_block,
    aws_subnet.public_subnet_2.cidr_block
  ]
}
```

## Outputs

* `password` - RDS master password
* `username` - DB master user name
* `address` - The address of the RDS instance
* `database` - The database name
* `hosted_zone_id` - The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)
* `rds_id` - The RDS instance ID