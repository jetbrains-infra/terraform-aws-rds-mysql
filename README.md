## About
Terraform module to run RDS MySQL instance. 


## Usage

Default RDS instances (`db.t2.small` type):
```
module "example_rds" {
  source              = "github.com/jetbrains-infra/terraform-aws-rds-mysql"
  name                = "example"
  rds_subnets         = ["${aws_subnet.private_subnet_1.id}","${aws_subnet.private_subnet_2.id}"]
  trusted_cidr_blocks = [
    "${aws_subnet.public_subnet_1.cidr_block}",
    "${aws_subnet.public_subnet_2.cidr_block}"
  ]
}
```

All options with default values:
```
module "example_ecs_cluster" {
  source              = "github.com/jetbrains-infra/terraform-aws-rds-mysql"
  rds_subnets         = ["${aws_subnet.private_subnet_1.id}","${aws_subnet.private_subnet_2.id}"]
  trusted_cidr_blocks = [
    "${aws_subnet.public_subnet_1.cidr_block}",
    "${aws_subnet.public_subnet_2.cidr_block}"
  ]
  
}
```

## Outputs
