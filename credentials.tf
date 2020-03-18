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
  length = 1
}