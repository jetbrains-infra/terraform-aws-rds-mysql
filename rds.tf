resource "aws_db_instance" "default" {
  count                           = "${local.rds_without_param_group}"
  instance_class                  = "${local.instance_type}"
  engine                          = "mysql"
  engine_version                  = "${local.engine_version}"
  vpc_security_group_ids          = ["${aws_security_group.default.id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.default.name}"
  identifier                      = "${local.id}"
  skip_final_snapshot             = true
  allocated_storage               = "${local.disk_size}"
  storage_type                    = "gp2"
  multi_az                        = "${local.multi_az}"
  backup_window                   = "${local.backup_window}"
  backup_retention_period         = "${local.backup_retention_period}"
  name                            = "${local.database}"
  username                        = "${local.username}"
  password                        = "${local.password}"
  publicly_accessible             = "${local.publicly_accessible}"
  storage_encrypted               = true
  apply_immediately               = "${local.apply_immediately}"
  enabled_cloudwatch_logs_exports = ["${local.logs_set}"]

  tags {
    Project = "${local.project}"
  }
}

resource "aws_db_instance" "parameterized" {
  count                           = "${local.rds_with_param_group}"
  instance_class                  = "${local.instance_type}"
  engine                          = "mysql"
  engine_version                  = "${local.engine_version}"
  vpc_security_group_ids          = ["${aws_security_group.default.id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.default.name}"
  identifier                      = "${local.id}"
  parameter_group_name            = "${local.parameter_group_name}"
  skip_final_snapshot             = true
  allocated_storage               = "${local.disk_size}"
  storage_type                    = "gp2"
  multi_az                        = "${local.multi_az}"
  backup_window                   = "${local.backup_window}"
  backup_retention_period         = "${local.backup_retention_period}"
  name                            = "${local.database}"
  username                        = "${local.username}"
  password                        = "${local.password}"
  publicly_accessible             = "${local.publicly_accessible}"
  storage_encrypted               = true
  apply_immediately               = "${local.apply_immediately}"
  enabled_cloudwatch_logs_exports = ["${local.logs_set}"]

  tags {
    Project = "${local.project}"
  }
}