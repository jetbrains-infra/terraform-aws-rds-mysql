resource "aws_db_subnet_group" "default" {
  name       = "${local.subnet_group_name}"
  subnet_ids = ["${local.db_subnets}"]

  tags {
    Project = "${local.project}"
  }
}