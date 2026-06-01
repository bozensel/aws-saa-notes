# Disaster Recovery & Migrations (AWS)

---

# 🛡️ Disaster Recovery Overview

Disaster recovery (DR) refers to the process of preparing for, responding to, and recovering from events that negatively impact business continuity or finances.

A disaster can occur in:
- On-premises environments
- AWS environments (single or multi-region)

## 🌍 DR Scenarios
- On-prem → On-prem (traditional DR, costly)
- On-prem → AWS (hybrid DR)
- AWS Region A → AWS Region B (cloud-native DR)

## 📌 Key Concepts
- **RPO (Recovery Point Objective):** Maximum acceptable data loss (time-based)
- **RTO (Recovery Time Objective):** Maximum acceptable downtime

---

# 🔄 Disaster Recovery Strategies

## 1. Backup & Restore
- Regular backups stored in AWS (S3, snapshots, etc.)
- Restore infrastructure when disaster occurs
- Highest RTO

## 2. Pilot Light
- Core components always running in AWS
- Minimal environment active at all times
- Faster recovery than backup/restore

## 3. Warm Standby
- Scaled-down but fully functional environment running
- Can scale up quickly during disaster

## 4. Hot Site / Multi-Site
- Fully active production environments in multiple locations
- Near-zero RTO, but expensive

---

# ⚡ Disaster Recovery Best Practices

## 💾 Backup
- EBS snapshots
- RDS automated backups and snapshots
- S3 lifecycle policies (IA, Glacier, CRR)
- Snowball / Storage Gateway for on-prem backup

## 🚀 High Availability
- Multi-AZ deployments (RDS, ElastiCache, etc.)
- Route 53 DNS failover
- EFS and S3 redundancy
- VPN fallback for Direct Connect

## 🔁 Replication
- Cross-region RDS replication
- Aurora Global Databases
- On-prem database replication to AWS

## ⚙️ Automation
- CloudFormation / Elastic Beanstalk for infra rebuild
- Lambda-based recovery automation
- CloudWatch alarm-based EC2 recovery

## 🧪 Chaos Testing
- Simulated failures (Netflix Chaos Engineering)
- Random instance termination testing

---

# 🆘 AWS Elastic Disaster Recovery (DRS)

Formerly CloudEndure Disaster Recovery.

## Features:
- Continuous block-level replication
- Recover physical, virtual, and cloud servers into AWS
- Supports databases (Oracle, MySQL, SQL Server)
- Protection against ransomware

---

# 🗄️ AWS Database Migration Service (DMS)

## Overview
- Fully managed database migration service
- Source database remains online during migration
- Supports continuous replication (CDC)

## Migration Types
- Homogeneous: Oracle → Oracle
- Heterogeneous: SQL Server → Aurora

## Sources
- On-prem databases (Oracle, MySQL, PostgreSQL, etc.)
- RDS / Aurora / DynamoDB
- Azure SQL / MongoDB / S3

## Targets
- RDS / Aurora
- Redshift
- DynamoDB
- S3
- OpenSearch
- Kafka / Kinesis

---

# 🔄 AWS Schema Conversion Tool (SCT)

Used when changing database engines.

## Use Cases
- Oracle → MySQL / Aurora
- SQL Server → PostgreSQL
- Teradata → Redshift

## Notes
- Not required if engine stays the same
- Works alongside DMS for full migration

---

# 🟣 AWS DMS Multi-AZ

- Synchronous standby replication in another AZ
- Benefits:
  - High availability
  - Reduced latency spikes
  - Improved durability

---

# 🧬 Database Migration Patterns

## MySQL → Aurora MySQL
- Snapshot restore into Aurora
- Read replica promotion method

## External MySQL → Aurora
- Backup to S3 (Percona XtraBackup)
- mysqldump method
- DMS migration

## PostgreSQL → Aurora PostgreSQL
- Snapshot restore
- Read replica promotion
- S3 import using aws_s3 extension
- DMS migration

---

# 🏗️ On-Premises Migration Strategies

## VM Migration
- VM Import/Export (EC2 conversion)
- Export EC2 back to on-prem if needed

## Discovery & Planning
- AWS Application Discovery Service
- AWS Migration Hub

## Lift & Shift
- AWS Application Migration Service (MGN)
- Continuous replication of live servers

---

# ☁️ AWS Backup

## Features
- Centralized backup management
- Supports EC2, EBS, RDS, DynamoDB, S3, EFS, FSx, etc.
- Cross-region and cross-account backups
- On-demand and scheduled backups

## Backup Plans
- Frequency: hourly, daily, weekly, custom cron
- Retention policies
- Lifecycle to cold storage

---

# 🔐 AWS Backup Vault Lock

- Enforces WORM (Write Once Read Many)
- Prevents deletion or modification of backups
- Even root user cannot delete locked backups
- Protection against ransomware and insider threats

---

# 🧭 AWS Application Discovery Service

## Purpose
- Collect on-prem infrastructure data for migration planning

## Modes
- Agentless discovery (VMware inventory)
- Agent-based discovery (detailed metrics & processes)

---

# 🚚 AWS Application Migration Service (MGN)

- Modern replacement for SMS & CloudEndure
- Continuous replication of servers
- Minimal downtime migrations
- Supports wide OS and database types

---

# 🖥️ VMware Cloud on AWS

- Run VMware workloads natively in AWS
- Hybrid cloud and migration support
- Supports DR and workload extension

---

# 📦 Large-Scale Data Transfer to AWS

## Internet / VPN
- Fast setup
- Very slow transfer (months for large datasets)

## Direct Connect
- Faster and stable (Gbps speeds)
- Longer setup time

## AWS Snowball
- Physical data transfer appliance
- Ideal for 10s–100s of TBs
- Fastest for one-time bulk migration

## Ongoing Sync
- Direct Connect + DMS
- AWS DataSync for file transfers

---

# 📊 Summary

AWS provides multiple disaster recovery and migration tools:

- Backup & Restore → cheapest, slowest recovery
- Pilot Light → minimal active infrastructure
- Warm Standby → scaled-down live system
- Multi-Site → full active redundancy

Migration tools:
- DMS → database migration
- SCT → schema conversion
- MGN → server migration
- Snowball → bulk data transfer

---









