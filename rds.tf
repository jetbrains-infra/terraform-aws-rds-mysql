resource "aws_db_instance" "default" {
  count                               = local.rds_without_param_group
  instance_class                      = local.instance_type
  engine                              = "mysql"
  engine_version                      = local.engine_version
  vpc_security_group_ids              = [aws_security_group.default.id]
  db_subnet_group_name                = aws_db_subnet_group.default.name
  identifier                          = local.id
  skip_final_snapshot                 = true
  allocated_storage                   = local.disk_size
  max_allocated_storage               = 1000
  storage_type                        = local.storage_type
  storage_encrypted                   = true
  multi_az                            = local.multi_az
  backup_window                       = local.backup_window
  backup_retention_period             = local.backup_retention_period
  db_name                             = local.database
  username                            = local.username
  password                            = local.password
  publicly_accessible                 = local.publicly_accessible
  apply_immediately                   = local.apply_immediately
  deletion_protection                 = local.deletion_protection
  enabled_cloudwatch_logs_exports     = local.logs_set
  monitoring_interval                 = local.enhanced_monitoring_interval
  performance_insights_enabled        = local.performance_insights_enabled
  iam_database_authentication_enabled = true
  tags                                = local.tags
}

resource "aws_db_instance" "parameterized" {
  count                               = local.rds_with_param_group
  instance_class                      = local.instance_type
  engine                              = "mysql"
  engine_version                      = local.engine_version
  vpc_security_group_ids              = [aws_security_group.default.id]
  db_subnet_group_name                = aws_db_subnet_group.default.name
  identifier                          = local.id
  parameter_group_name                = local.parameter_group_name
  skip_final_snapshot                 = true
  allocated_storage                   = local.disk_size
  max_allocated_storage               = 1000
  storage_type                        = "gp2"
  storage_encrypted                   = true
  multi_az                            = local.multi_az
  backup_window                       = local.backup_window
  backup_retention_period             = local.backup_retention_period
  db_name                             = local.database
  username                            = local.username
  password                            = local.password
  publicly_accessible                 = local.publicly_accessible
  apply_immediately                   = local.apply_immediately
  deletion_protection                 = local.deletion_protection
  enabled_cloudwatch_logs_exports     = local.logs_set
  monitoring_interval                 = local.enhanced_monitoring_interval
  performance_insights_enabled        = local.performance_insights_enabled
  iam_database_authentication_enabled = true
  tags                                = local.tags
}