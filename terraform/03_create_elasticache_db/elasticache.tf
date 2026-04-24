provider "aws" {
  region = "eu-central-1"
}

# --- VPC (required because ElastiCache must run inside a VPC) ---
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# --- Subnets (at least 2 for ElastiCache subnet group) ---
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true
}

# --- Security Group ---
resource "aws_security_group" "redis_sg" {
  name   = "redis-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ⚠️ open for demo only
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- Subnet Group (required for ElastiCache) ---
resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-subnet-group"
  subnet_ids = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]
}

# --- ElastiCache Redis Cluster ---
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "simple-redis"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"

  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [aws_security_group.redis_sg.id]
}

# --- Output ---
output "redis_endpoint" {
  value = aws_elasticache_cluster.redis.cache_nodes[0].address
}