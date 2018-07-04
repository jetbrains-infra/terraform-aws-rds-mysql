resource "aws_db_instance" "default" {
  count                           = "${ var.parameter_group_name == "" ? 1 : 0}"
  instance_class                  = "${var.instance_type}"
  engine                          = "mysql"
  engine_version                  = "${var.version}"
  vpc_security_group_ids          = ["${aws_security_group.default.id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.default.name}"
  identifier                      = "${lower(var.name)}"
  skip_final_snapshot             = true
  allocated_storage               = "${var.disk_size}"
  storage_type                    = "gp2"
  multi_az                        = "${var.multi_az}"
  backup_window                   = "${var.backup_window}"
  backup_retention_period         = "${var.backup_retention_period}"
  name                            = "${var.database == "" ? local.database : var.database}"
  username                        = "${var.username == "" ? local.username : var.username}"
  password                        = "${var.password == "" ? local.password : var.password}"
  publicly_accessible             = "${var.publicly_accessible}"
  storage_encrypted               = true
  apply_immediately               = "${var.apply_immediately}"
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
}

resource "aws_db_instance" "parameterized" {
  count                           = "${ var.parameter_group_name == "" ? 0 : 1}"
  instance_class                  = "${var.instance_type}"
  engine                          = "mysql"
  engine_version                  = "${var.version}"
  vpc_security_group_ids          = ["${aws_security_group.default.id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.default.name}"
  identifier                      = "${lower(var.name)}"
  parameter_group_name            = "${var.parameter_group_name}"
  skip_final_snapshot             = false
  allocated_storage               = "${var.disk_size}"
  storage_type                    = "gp2"
  multi_az                        = "${var.multi_az}"
  backup_window                   = "${var.backup_window}"
  backup_retention_period         = "${var.backup_retention_period}"
  name                            = "${var.database == "" ? local.database : var.database}"
  username                        = "${var.username == "" ? local.username : var.username}"
  password                        = "${var.password == "" ? local.password : var.password}"
  publicly_accessible             = "${var.publicly_accessible}"
  storage_encrypted               = true
  apply_immediately               = "${var.apply_immediately}"
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
}