# RDS, Aurora & ElastiCache – Notes

## 🔹 Amazon RDS (Relational Database Service)

Amazon RDS is a managed database service that lets you run SQL-based databases in AWS without handling the infrastructure.

Supported engines:
- PostgreSQL
- MySQL
- MariaDB
- Oracle
- Microsoft SQL Server
- IBM DB2
- Amazon Aurora (AWS-native)

### Why use RDS instead of EC2-based DB?

With RDS, AWS handles most operational tasks:

- Automatic provisioning & OS patching
- Continuous backups + point-in-time recovery
- Monitoring dashboards
- Read replicas for scaling reads
- Multi-AZ for high availability
- Maintenance windows
- Easy scaling (compute + storage)

⚠️ Limitation: No SSH access to the underlying host.

---

## 🔹 Storage Auto Scaling

RDS can automatically grow storage when needed.

It triggers when:
- Free space < 10%
- Condition lasts ≥ 5 minutes
- Last scaling was ≥ 6 hours ago

You define a **maximum storage limit**.

Good for unpredictable workloads.

---

## 🔹 Read Replicas

- Up to 15 replicas
- Can be in same AZ, cross-AZ, or cross-region
- Replication is **asynchronous**
- Used for **read-only workloads (SELECT)**

Example:
- Main DB handles writes
- Analytics/reporting runs on replicas

Replicas can be promoted to standalone DBs.

---

## 🔹 Multi-AZ (High Availability)

- Uses **synchronous replication**
- Single DNS endpoint
- Automatic failover

Used for:
- Disaster recovery
- High availability

❗ Not used for scaling (unlike read replicas)

---

## 🔹 RDS Custom

Gives more control compared to standard RDS.

You can:
- Access OS via SSH
- Install custom patches
- Modify DB settings

Use when:
- Licensing constraints exist
- Deep customization is required

---

## 🔹 Amazon Aurora

AWS-built database compatible with MySQL & PostgreSQL.

Key advantages:
- ~5x faster than MySQL, ~3x faster than PostgreSQL
- Auto-scaling storage up to 256 TB
- Faster replication (low latency)
- Built-in high availability

### Architecture

- 6 copies of data across 3 AZs
- Writes require 4 copies, reads require 3
- Automatic failover (<30 seconds)

Supports:
- Up to 15 read replicas
- Cross-region replication

---

## 🔹 Aurora Features

- Auto failover
- Continuous backup
- Zero-downtime patching
- Backtrack (restore without snapshot)
- Monitoring & maintenance

---

## 🔹 Aurora Serverless

- Automatically scales based on load
- No capacity planning
- Pay-per-use

Best for:
- Intermittent workloads
- Dev/test environments

---

## 🔹 Global Aurora

- One primary region (read/write)
- Up to 10 secondary regions (read-only)

Benefits:
- <1 second replication lag
- Disaster recovery in <1 minute
- Reduced latency for global users

---

## 🔹 Backups

### RDS
- Automated backups (1–35 days)
- Transaction logs every 5 minutes
- Manual snapshots (manual retention)

### Aurora
- Always-on automated backups
- Point-in-time restore
- Manual snapshots supported

---

## 🔹 Security

- Encryption at rest via KMS
- Encryption in transit via TLS
- IAM authentication (no password needed)
- Security Groups control access

❗ No SSH access (except RDS Custom)

---

## 🔹 RDS Proxy

A managed proxy layer between app and DB.

Benefits:
- Connection pooling
- Reduced DB load
- Faster failover
- Works with Secrets Manager

---

# 🔹 ElastiCache

Managed in-memory caching service.

Supports:
- Redis
- Memcached

### Why use it?

- Extremely low latency
- Reduces database load
- Improves application speed
- Enables stateless apps

---

## 🔹 Common Use Cases

### 1. Database Caching
- App checks cache first
- If miss → query DB → store result in cache

### 2. Session Storage
- Store user sessions centrally
- Works across multiple app instances

---

## 🔹 Redis vs Memcached

### Redis
- Multi-AZ with failover
- Persistence support
- Backups available
- Supports advanced data structures

### Memcached
- Simple key-value store
- No persistence
- No replication
- Multi-threaded

---

## 🔹 Caching Strategies

- Lazy Loading → load into cache only when needed
- Write Through → update cache + DB together
- Session Store → store temporary user data

⚠️ Biggest challenge: cache invalidation

---

## 🔹 Example Use Case (Redis)

Leaderboard system:
- Uses sorted sets
- Automatically ranks users in real-time
- Ensures fast updates and retrieval

---

## ✅ Summary

- RDS = managed relational DB
- Aurora = high-performance AWS-native DB
- ElastiCache = in-memory caching layer

Together, they help build:
- Scalable
- Highly available
- Low-latency applications


