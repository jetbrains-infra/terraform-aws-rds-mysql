resource "aws_security_group" "default" {
  name   = "RDS"
  vpc_id = "${local.vpc_id}"

  ingress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = ["${var.trusted_cidr_blocks}"]
  }

}