resource "aws_db_subnet_group" "default" {
  name       = "${local.name}"
  subnet_ids = ["${local.db_subnets}"]

  tags {
    Project = "${local.project}"
  }
}