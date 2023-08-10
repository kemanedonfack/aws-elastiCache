provider "aws" {
  region = "eu-central-1"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}


module "redis" {
  source = "../../"

  name_prefix           = "redis-basic-example"
  number_cache_clusters = 1
  node_type             = "cache.t3.micro"

  engine_version = "6.x"
  port           = 6379


  apply_immediately = true
  family            = "redis6.x"
  description       = "Test elasticache redis."

  subnet_ids = data.aws_subnet_ids.all.ids
  vpc_id     = data.aws_vpc.default.id

  at_rest_encryption_enabled = false
  transit_encryption_enabled = false

  ingress_cidr_blocks = ["0.0.0.0/0"]

  parameter = [
    {
      name  = "repl-backlog-size"
      value = "16384"
    }
  ]

  tags = {
    Project = "Test"
  }
}