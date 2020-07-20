resource "aws_security_group" "default" {
  name   = local.name
  vpc_id = local.vpc_id
  tags   = local.tags
}

resource "aws_security_group_rule" "allow_connections_to_mysql" {
  from_port         = 3306
  protocol          = "TCP"
  to_port           = 3306
  cidr_blocks       = local.trusted_cidr_blocks
  security_group_id = aws_security_group.default.id
  type              = "ingress"
}
