resource "random_string" "password" {
  length           = 14
  special          = true
  override_special = "!#$%&'()*+,-.:;<=>?_`{|}~"
}

resource "random_pet" "username" {
  length    = 2
  separator = "_"
}

resource "random_pet" "db_name" {
  length    = 1
}

locals {
  username = "${random_pet.username.id}"
  password = "${random_string.password.result}"
  database = "${random_pet.db_name.id}"
}