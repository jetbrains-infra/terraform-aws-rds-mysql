resource "aws_db_subnet_group" "default" {
  name       = "${var.name}"
  subnet_ids = ["${var.db_subnets}"]
}