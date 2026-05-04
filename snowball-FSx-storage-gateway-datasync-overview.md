# AWS Storage Extras

## AWS Snow Family

### AWS Snowball

AWS Snowball is a secure, portable device designed to transfer large volumes of data into and out of AWS.

### Key Characteristics
- Handles data transfers at **petabyte scale**
- Ideal when network transfer is slow or unreliable
- Physically ships data to AWS data centers 

### When to Use Snowball

Use Snowball if:
- Data transfer over the network would take **more than a week**
- You face:
  - Limited bandwidth
  - High network costs
  - Unstable connectivity

---

## Edge Computing with Snowball

### What is Edge Computing?

Edge computing means processing data close to where it is generated instead of sending it to the cloud. 

### Typical Locations
- Vehicles (trucks, ships)
- Remote industrial sites
- Mining stations

### Snowball Edge Capabilities
- Run **EC2 instances** at the edge
- Execute **AWS Lambda functions**
- Perform:
  - Data preprocessing
  - Machine learning inference
  - Media transcoding

### Device Types
- **Compute Optimized** → for processing workloads
- **Storage Optimized** → for large data transfers

---

## Snowball + Glacier Architecture

Snowball cannot upload directly to Glacier.

Snowball → Amazon S3 → Lifecycle Policy → Glacier


---

## Amazon FSx Overview

Amazon FSx provides fully managed, high-performance file systems.

### Supported File Systems
- Windows File Server
- Lustre
- NetApp ONTAP
- OpenZFS

---

## FSx for Windows File Server

- Fully managed Windows file system
- Supports:
  - SMB protocol
  - NTFS permissions
  - Active Directory integration
- Features:
  - Multi-AZ support
  - Daily backups to S3
  - High throughput and IOPS

### Use Cases
- Shared file storage
- Enterprise applications
- Home directories

---

## FSx for Lustre

High-performance file system for compute-heavy workloads.

### Use Cases
- Machine Learning
- High Performance Computing (HPC)
- Financial modeling
- Video processing

### Features
- Extremely high throughput (100s GB/s)
- Sub-millisecond latency
- Native integration with S3

S3 ↔ FSx for Lustre ↔ Compute Workloads


### Deployment Types
- **Scratch** → temporary, no replication, faster
- **Persistent** → durable, replicated, long-term

---

## FSx for NetApp ONTAP

- Fully managed NetApp ONTAP on AWS
- Supports:
  - NFS, SMB, iSCSI
- Compatible with:
  - Linux, Windows, macOS
  - VMware environments

### Features
- Automatic scaling
- Snapshots & replication
- Data compression and deduplication
- Instant cloning

---

## FSx for OpenZFS

- Managed OpenZFS file system
- Supports NFS protocols

### Features
- Up to 1 million IOPS
- Very low latency (<0.5 ms)
- Snapshots and compression
- Instant cloning

---

## Hybrid Cloud Storage

Many organizations operate in a hybrid model:
- Part of infrastructure in AWS
- Part on-premises

### Reasons
- Gradual cloud migration
- Compliance requirements
- Security policies

---

## AWS Storage Gateway

Storage Gateway connects on-premises systems with AWS storage.

### Use Cases
- Backup & restore
- Disaster recovery
- Tiered storage
- Low-latency local access

---

### Storage Gateway Types

#### 1. S3 File Gateway

- Provides file-based access (NFS/SMB) to S3
- Frequently accessed data is cached locally
- Integrates with IAM and Active Directory

On-Prem → File Gateway → S3 Bucket


---

#### 2. Volume Gateway

- Block storage via iSCSI

Types:
- **Cached Volumes** → frequently accessed data locally cached
- **Stored Volumes** → entire dataset stored locally, backed up to S3

---

#### 3. Tape Gateway

- Replaces physical tapes with virtual tapes
- Uses:
  - S3 for active storage
  - Glacier for archival

Backup Software → Tape Gateway → S3 → Glacier


---

## AWS Transfer Family

Managed service for file transfers into AWS storage.

### Supported Protocols
- FTP
- FTPS
- SFTP

### Features
- Highly available (Multi-AZ)
- Scalable
- Integrates with:
  - Active Directory
  - LDAP
  - Cognito

### Use Cases
- File sharing
- Data ingestion
- Enterprise systems (CRM, ERP)

---

## AWS DataSync

DataSync simplifies large-scale data transfers.

### Capabilities
- Transfer data:
  - On-prem → AWS
  - AWS → AWS
- Supports:
  - S3
  - EFS
  - FSx

### Features
- High-speed transfers (up to 10 Gbps per agent)
- Preserves metadata and permissions
- Scheduled sync tasks

On-Prem → DataSync Agent → AWS Storage


---

## Storage Services Comparison

| Service | Type | Use Case |
|--------|------|----------|
| S3 | Object Storage | General-purpose storage |
| S3 Glacier | Archive Storage | Long-term backups |
| EBS | Block Storage | EC2 disks |
| Instance Store | Local Storage | High-performance temporary data |
| EFS | File Storage | Linux shared file system |
| FSx Windows | File Storage | Windows workloads |
| FSx Lustre | HPC File System | Compute-heavy workloads |
| FSx ONTAP | Multi-protocol | Enterprise storage |
| FSx OpenZFS | ZFS File System | Low-latency workloads |
| Storage Gateway | Hybrid | On-prem integration |
| Transfer Family | File Transfer | FTP/SFTP workloads |
| DataSync | Data Migration | Bulk transfers |
| Snow Family | Offline Transfer | Massive data migration |

---

## Summary

AWS provides a wide range of storage solutions tailored for different needs:

- **Snow Family** → offline data transfer
- **FSx** → high-performance file systems
- **Storage Gateway** → hybrid storage integration
- **Transfer Family** → managed file transfers
- **DataSync** → automated data migration

Choosing the right service depends on:
- Performance requirements
- Access patterns
- Integration needs
- Cost considerations




