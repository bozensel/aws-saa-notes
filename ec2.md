# Amazon EC2 – Detailed Notes

---

## 🖥️ Amazon EC2 Overview

Amazon EC2 (Elastic Compute Cloud) is a core AWS service that provides **virtual machines on demand**.

It is part of the **Infrastructure as a Service (IaaS)** model.

With EC2, you can:
- Run virtual servers in the cloud
- Attach persistent storage (EBS)
- Balance traffic across instances (ELB)
- Automatically scale resources (Auto Scaling Groups)

👉 EC2 is one of the most important AWS services. 

---

## ⚙️ Instance Configuration Options

When launching an EC2 instance, you define:

- Operating System (Linux, Windows, etc.)
- CPU (number of vCPUs)
- Memory (RAM)
- Storage:
  - EBS / EFS (network-based)
  - Instance Store (local disk)
- Network settings (IP, bandwidth)
- Security Group (firewall rules)
- User Data (startup automation script)

---

## 🚀 EC2 User Data (Bootstrapping)

User Data allows you to run commands **automatically when the instance starts for the first time**.

Typical usage:
- Install software (e.g., Nginx, Docker)
- Apply OS updates
- Fetch configuration files
- Initialize application setup

Key points:
- Runs only once (at first launch)
- Executes with root privileges

👉 Example: automatically deploy a web server at startup

---

## 🧩 EC2 Instance Types

Instance types are designed for different workloads.

Example naming:

- `t` → instance family
- `3` → generation
- `large` → size

---

### 🟢 General Purpose
Balanced CPU, memory, and networking  
👉 Example: backend API, small web app

---

### 🔵 Compute Optimized
High CPU performance  
👉 Example: data processing, encoding jobs

---

### 🟣 Memory Optimized
Large memory capacity  
👉 Example: caching systems, real-time analytics

---

### 🟠 Storage Optimized
High disk throughput  
👉 Example: large-scale logging, NoSQL databases

---

## 🔥 Security Groups (Firewall)

Security Groups control traffic to/from EC2 instances.

They define:
- Allowed ports
- Allowed IP ranges
- Inbound & outbound rules

Important behavior:
- Default: deny all inbound traffic
- Default: allow all outbound traffic
- Only **allow rules** (no explicit deny)

Additional notes:
- Can be attached to multiple instances
- Defined per VPC/Region
- Applied outside the instance (blocked traffic never reaches OS)

👉 Tip:
- Timeout → likely security group issue  
- Connection refused → app not running

---

## 🌐 Common Ports

- 22 → SSH (Linux login)
- 21 → FTP
- 80 → HTTP
- 443 → HTTPS
- 3389 → RDP (Windows)

---

## 💰 EC2 Pricing Models

### 🟢 On-Demand
- Pay per usage
- No commitment  
👉 Use for short-term or unpredictable workloads

---

### 🔵 Reserved Instances
- 1 or 3 year commitment
- Significant discount  
👉 Best for stable workloads (e.g., database servers)

Variants:
- Standard (fixed)
- Convertible (flexible changes)

---

### 🟣 Savings Plans
- Commit to usage ($/hour)
- Flexible across instance sizes and OS

👉 Good middle-ground between flexibility and savings

---

### 🟡 Spot Instances
- Very low cost
- Can be terminated anytime

👉 Ideal for:
- Batch jobs
- Data processing
- Fault-tolerant workloads

🚫 Avoid for:
- Databases
- Critical applications

---

### 🔴 Dedicated Options
- Dedicated hardware
- High cost

👉 Used for:
- Compliance requirements
- Bring Your Own License (BYOL)

---

### 🟠 Capacity Reservations
- Reserve compute capacity in a specific AZ
- No cost discount

👉 Ensures availability when needed

---

## 🌍 Networking Basics

### Public IP
- Reachable from internet
- Must be globally unique

---

### Private IP
- Used inside private network (VPC)
- Not directly accessible from internet

---

## 🔗 Elastic IP

Static public IPv4 address.

- Doesn’t change on restart
- Can be reassigned to another instance

👉 Best practice:
Avoid overusing → use DNS or Load Balancer instead

---

## 📦 Placement Groups

Control how instances are physically placed.

### Cluster
- High performance, low latency
- Same AZ
👉 Example: HPC workloads

---

### Spread
- Instances on separate hardware
- Higher fault tolerance
👉 Example: critical services

---

### Partition
- Large distributed systems
- Multiple isolated groups
👉 Example: big data clusters (Kafka, Hadoop)

---

## 🌐 Elastic Network Interface (ENI)

Virtual network adapter.

Includes:
- Private IP(s)
- Security groups
- MAC address

👉 Can be detached and reattached to another instance

---

## 💤 EC2 Hibernate

Preserves RAM state when stopping instance.

- Faster restart
- Requires encrypted EBS root volume

👉 Use cases:
- Long initialization apps
- Memory-heavy workloads

---

## 💾 Storage Options

### 🟢 EBS (Elastic Block Store)
- Network-attached storage
- Persistent
- AZ-specific

👉 Like a cloud hard disk

---

### 🟡 Instance Store
- Local disk (high performance)
- Data lost on stop

👉 Use for temporary data (cache)

---

### 🔵 EFS (Elastic File System)
- Shared file system
- Multi-AZ
- Scales automatically

👉 Example: shared storage for multiple web servers

---

## 📸 EBS Snapshots

- Backup of EBS volume
- Stored in S3 internally
- Can restore in another AZ/Region

Extra features:
- Archive tier (cheaper storage)
- Recycle Bin (recovery)
- Fast Snapshot Restore

---

## 🧠 AMI (Amazon Machine Image)

Template used to launch EC2 instances.

Contains:
- OS
- Installed software
- Configuration

👉 Used to standardize deployments

---

## 💽 EBS Volume Types

### SSD (Performance)

- gp3 / gp2 → general purpose
- io1 / io2 → high performance (databases)

---

### HDD (Cost-efficient)

- st1 → throughput-heavy workloads
- sc1 → rarely accessed data

---

## 🔐 EBS Encryption

- Encrypts data at rest and in transit
- Uses AWS KMS
- Minimal performance impact

---

## 📂 EFS (Elastic File System)

- Shared NFS storage
- Accessible by multiple EC2 instances
- Automatically scales

Use cases:
- CMS systems
- Shared application data
- Web hosting

---

## ⚖️ EBS vs EFS

| Feature | EBS | EFS |
|--------|-----|-----|
| Usage | Single instance | Multiple instances |
| Scope | Single AZ | Multi-AZ |
| Type | Block storage | File system |
| Use case | Databases | Shared storage |

---

## 🧠 Exam Tips

- Stateless app → Auto Scaling + Load Balancer
- Cheap compute → Spot Instances
- Persistent disk → EBS
- Shared storage → EFS
- Static IP → Elastic IP (rarely recommended)
- Security → Security Groups = firewall
