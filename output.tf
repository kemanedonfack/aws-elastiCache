# output "redis_endpoint" {
#   description = "The endpoint of the ElastiCache Redis instance"
#   value       = aws_elasticache_cluster.redis.cache_nodes.endpoint
# }

output "redis_node_type" {
  description = "The node type of the ElastiCache Redis instance"
  value       = aws_elasticache_cluster.redis.node_type
}

output "redis_cluster_id" {
  description = "The ID of the ElastiCache Redis cluster"
  value       = aws_elasticache_cluster.redis.id
}

output "redis_security_group_ids" {
  description = "The list of security group IDs for the ElastiCache Redis instance"
  value       = aws_elasticache_cluster.redis.security_group_ids
}

output "redis_subnet_group_name" {
  description = "The name of the ElastiCache Redis subnet group"
  value       = aws_elasticache_subnet_group.redis.name
}

output "redis_engine_version" {
  description = "The engine version of the ElastiCache Redis instance"
  value       = aws_elasticache_cluster.redis.engine_version
}

output "redis_maintenance_window" {
  description = "The maintenance window of the ElastiCache Redis instance"
  value       = aws_elasticache_cluster.redis.maintenance_window
}

output "redis_snapshot_window" {
  description = "The snapshot window of the ElastiCache Redis instance"
  value       = aws_elasticache_cluster.redis.snapshot_window
}

output "redis_snapshot_retention_limit" {
  description = "The snapshot retention limit of the ElastiCache Redis instance"
  value       = aws_elasticache_cluster.redis.snapshot_retention_limit
}

    