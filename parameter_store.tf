resource "aws_ssm_parameter" "password" {
  count = local.store_parameters
  name  = "${local.parameter_prefix}/password"
  type  = "String"
  value = local.password
  tags  = local.tags
}

resource "aws_ssm_parameter" "username" {
  count = local.store_parameters
  name  = "${local.parameter_prefix}/username"
  type  = "String"
  value = local.username
  tags  = local.tags
}

resource "aws_ssm_parameter" "database" {
  count = local.store_parameters
  name  = "${local.parameter_prefix}/database"
  type  = "String"
  value = local.database
  tags  = local.tags
}

resource "aws_ssm_parameter" "address" {
  count = local.store_parameters
  name  = "${local.parameter_prefix}/address"
  type  = "String"
  value = local.address
  tags  = local.tags
}

resource "aws_ssm_parameter" "zone_id" {
  count = local.store_parameters
  name  = "${local.parameter_prefix}/zone_id"
  type  = "String"
  value = local.hosted_zone_id
  tags  = local.tags
}

resource "aws_ssm_parameter" "id" {
  count = local.store_parameters
  name  = "${local.parameter_prefix}/id"
  type  = "String"
  value = local.id
  tags  = local.tags
}

resource "aws_ssm_parameter" "security_group_id" {
  count = local.store_parameters
  name  = "${local.parameter_prefix}/security_group_id"
  type  = "String"
  value = aws_security_group.default.id
  tags  = local.tags
}