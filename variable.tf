variable "description" {
  default = "test"
}

variable "redisparameter" {
  default = "cache-params"
}

variable "family" {
  default = "redis7"
}

variable "aws_profile" {
  description = "AWS profile to use for authentication"
  type        = string
  default     = "sif-user"
}

variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "eu-north-1"
}

variable "engine" {
  description = "ElastiCache engine (e.g., redis)"
  type        = string
  default     = "redis"
}

variable "cluster_id" {
  description = "ElastiCache cluster ID"
  type        = string
  default = "mytest-cluster"
}

variable "node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type        = number
  default     = 1
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "List of Ingress CIDR blocks."
  default     = []
}

variable "ingress_self" {
  type        = bool
  description = "Specify whether the security group itself will be added as a source to the ingress rule."
  default     = false
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of Security Groups"
  default     = []
}


variable "port" {
  description = "Port number for the cache cluster"
  type        = number
  default     = 6379
}

variable "vpc_id" {
  description = "ID of the VPC where the cache cluster will be created"
  type        = string
  default     = "vpc-0c7a48ffa82b8c7ae"
}

variable "subnet_ids" {
  description = "List of subnet IDs in which the cache cluster will be created"
  type        = list(string)
  default     = ["subnet-08cfb65242d6db186", "subnet-0c819740100e5e234"]
}

variable "engine_version" {
  description = "ElastiCache engine version"
  type        = string
  default     = "6.x"
}

variable "maintenance_window" {
  description = "Maintenance window for the cache cluster"
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "snapshot_window" {
  description = "Snapshot window for the cache cluster"
  type        = string
  default     = "03:00-04:00"
}

variable "snapshot_retention_limit" {
  description = "Snapshot retention limit for the cache cluster"
  type        = number
  default     = 7
}

variable "auto_minor_version_upgrade" {
  default = true
  type    = string
}

variable "automatic_failover_enabled" {
  default     = true
  type        = bool
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
}

variable "at_rest_encryption_enabled" {
  default     = true
  type        = bool
  description = "Whether to enable encryption at rest."
}

variable "transit_encryption_enabled" {
  default     = true
  type        = bool
  description = "Whether to enable encryption in transit."
}

variable "apply_immediately" {
  default     = false
  type        = bool
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
}

variable "auth_token" {
  type        = string
  description = "The password used to access a password protected server. Can be specified only if `transit_encryption_enabled = true`."
  default     = ""
}

variable "kms_key_id" {
  type        = string
  description = "The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if `at_rest_encryption_enabled = true`"
  default     = ""
}

variable "parameter" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Enable creation of a native redis cluster."
  default     = false
}

variable "replicas_per_node_group" {
  type        = number
  default     = 0
  description = "Required when `cluster_mode_enabled` is set to true. Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource."
}

variable "num_node_groups" {
  type        = number
  default     = 0
  description = "Required when `cluster_mode_enabled` is set to true. Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications."
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important."
  default     = null
}

variable "multi_az_enabled" {
  type        = string
  description = "Specifies whether to enable Multi-AZ Support for the replication group. If true, `automatic_failover_enabled` must also be enabled. Defaults to false."
  default     = null
}

