terraform state list
aws_elasticache_cluster.redis
aws_elasticache_subnet_group.redis_subnet_group
aws_security_group.redis_sg
aws_subnet.subnet1
aws_subnet.subnet2
aws_vpc.main

terraform state show aws_elasticache_cluster.redis
# aws_elasticache_cluster.redis:
resource "aws_elasticache_cluster" "redis" {
    arn                        = "arn:aws:elasticache:eu-central-1:323928186579:cluster:simple-redis"
    auto_minor_version_upgrade = "true"
    availability_zone          = "eu-central-1b"
    az_mode                    = "single-az"
    cache_nodes                = [
        {
            address           = "simple-redis.sfhl1p.0001.euc1.cache.amazonaws.com"
            availability_zone = "eu-central-1b"
            id                = "0001"
            outpost_arn       = null
            port              = 6379
        },
    ]
    cluster_id                 = "simple-redis"
    engine                     = "redis"
    engine_version             = "7.1"
    engine_version_actual      = "7.1.0"
    id                         = "simple-redis"
    ip_discovery               = "ipv4"
    maintenance_window         = "wed:05:00-wed:06:00"
    network_type               = "ipv4"
    node_type                  = "cache.t3.micro"
    num_cache_nodes            = 1
    parameter_group_name       = "default.redis7"
    port                       = 6379
    preferred_outpost_arn      = null
    region                     = "eu-central-1"
    replication_group_id       = null
    security_group_ids         = [
        "sg-01a8c6f9014f6bce4",
    ]
    snapshot_retention_limit   = 0
    snapshot_window            = "00:00-01:00"
    subnet_group_name          = "redis-subnet-group"
    tags_all                   = {}
    transit_encryption_enabled = false
}