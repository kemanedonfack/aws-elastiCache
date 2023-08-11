resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  port                 = var.port
  parameter_group_name = "default.redis7"
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids  = concat(var.security_group_ids, [aws_security_group.redis.id])
  maintenance_window   = var.maintenance_window
  snapshot_window      = var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit
  # multi_az_enabled           = var.multi_az_enabled
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  # at_rest_encryption_enabled = var.at_rest_encryption_enabled
  # transit_encryption_enabled = var.transit_encryption_enabled
  # auth_token                 = var.auth_token != "" ? var.auth_token : null
  # kms_key_id                 = var.kms_key_id
  apply_immediately = var.apply_immediately

  tags = {
    Name = "ElastiCacheRedis"
  }
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "redis-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "ElastiCacheRedisSubnetGroup"
  }
}

resource "aws_security_group" "redis" {
  name        = "redis-sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ElastiCacheRedisSecurityGroup"
    }


   lifecycle {
    create_before_destroy = true
  }


}

resource "aws_elasticache_parameter_group" "redis" {
  name        = var.redisparameter
  family      = var.family
  description = var.description

  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }    



  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ingress" {
  count = var.ingress_self ? 1 : 0

  type              = "ingress"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.redis.id
}

resource "aws_security_group_rule" "ingress_cidr_blocks" {
  count = length(var.ingress_cidr_blocks) != 0 ? 1 : 0

  type              = "ingress"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidr_blocks
  security_group_id = aws_security_group.redis.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.redis.id
}