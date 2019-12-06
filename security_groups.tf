resource "aws_security_group" "default" {
  name   = local.name
  vpc_id = local.vpc_id

  ingress {
    from_port   = 3306
    protocol    = "TCP"
    to_port     = 3306
    cidr_blocks = local.trusted_cidr_blocks
  }

  tags = {
    Project = local.project
  }
}