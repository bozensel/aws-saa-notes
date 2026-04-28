# Amazon S3 (Simple Storage Service)

## Overview
Amazon S3 is one of the core storage services in AWS. It provides highly scalable object storage and is designed to handle virtually unlimited amounts of data.

- Often described as "infinitely scalable"
- Widely used as a backend for applications and websites
- Integrated with many AWS services
- Stores data as objects inside containers called buckets

---

## Common Use Cases

S3 is used in a variety of scenarios:

- Backup and long-term storage
- Disaster recovery setups
- Archiving data
- Hybrid cloud storage solutions
- Hosting static websites
- Storing media files (images, videos)
- Data lakes and analytics workloads
- Software distribution (downloads, updates)

---

## Buckets

Buckets are containers used to store objects.

Key points:

- Bucket names must be globally unique (across all AWS accounts)
- Buckets are created in a specific AWS region
- Naming rules:
  - Only lowercase letters and numbers
  - No underscores
  - Length between 3–63 characters
  - Must not resemble an IP address
  - Must not start with `xn--`
  - Must not end with `-s3alias`

Although S3 is a global service, bucket data physically resides in the chosen region.

---

## Objects

Objects represent the actual files stored in S3.

Each object consists of:

- **Key** → full path of the object  
  Example:
s3://my-bucket/folder1/file.txt


- S3 does not have real directories — folder structure is simulated using prefixes (`/`)

### Object Details

- Maximum object size: **5 TB**
- Uploads > 5 GB require **multipart upload**
- Metadata:
- Key-value pairs (system or user-defined)
- Tags:
- Up to 10 key-value pairs
- Used for organization, billing, lifecycle rules
- Version ID:
- Exists if versioning is enabled

---

## Security Model

S3 security works on multiple levels:

### 1. User-Based (IAM Policies)
- Define permissions for users/roles
- Control API-level access

### 2. Resource-Based (Bucket Policies)
- JSON-based rules applied directly to buckets
- Allow cross-account access

### 3. ACLs (Access Control Lists)
- Object-level or bucket-level permissions
- Less commonly used today
- Can be disabled

### Access Rule

Access is granted only if:
- Allowed by IAM **OR** bucket policy
- AND no explicit deny exists

---

## Bucket Policies

Bucket policies are JSON documents used to define access rules.

They include:

- **Effect** → Allow or Deny
- **Principal** → who gets access
- **Action** → what actions are allowed
- **Resource** → which bucket/object

### Common Use Cases

- Making a bucket public
- Enforcing encryption on uploads
- Granting access to another AWS account

---

## Block Public Access

AWS provides settings to prevent accidental data exposure:

- Can be configured per bucket or account
- Recommended to keep enabled unless public access is required

---

## Static Website Hosting

S3 can host static websites (HTML, CSS, JS).

Example URL:
http://bucket-name.s3-website-region.amazonaws.com


⚠️ If you see `403 Forbidden`:
- Check bucket policy
- Ensure public read access is allowed

---

## Versioning

Versioning allows keeping multiple versions of the same object.

Benefits:

- Protects against accidental deletion
- Enables rollback to previous versions

Notes:

- Must be enabled at bucket level
- Old files before enabling get version ID = `null`
- Disabling versioning does NOT delete old versions

---

## Replication (CRR & SRR)

S3 supports automatic replication of objects:

### Types

- **CRR (Cross-Region Replication)** → different region
- **SRR (Same-Region Replication)** → same region

### Requirements

- Versioning must be enabled on both buckets
- Replication is asynchronous

### Use Cases

- Disaster recovery
- Compliance
- Multi-region access
- Log aggregation

### Important Notes

- Only new objects are replicated
- Existing objects require batch replication
- Delete markers can be replicated (optional)
- No chained replication

---

## Storage Classes

S3 offers multiple storage tiers depending on usage patterns:

- S3 Standard
- S3 Standard-IA (Infrequent Access)
- S3 One Zone-IA
- S3 Glacier Instant Retrieval
- S3 Glacier Flexible Retrieval
- S3 Glacier Deep Archive
- S3 Intelligent-Tiering

Data can be moved between classes manually or via lifecycle rules.

---

## Durability vs Availability

### Durability
- 99.999999999% (11 9’s)
- Extremely low risk of data loss

### Availability
- Depends on storage class
- Example:
  - S3 Standard → 99.99% (~53 minutes downtime/year)

---

## S3 Standard

- Designed for frequently accessed data
- High throughput and low latency
- 99.99% availability

Use cases:
- Applications
- Content delivery
- Big data analytics

---

## Infrequent Access Storage

Lower cost for less frequently accessed data.

### Standard-IA
- Multi-AZ
- 99.9% availability

### One Zone-IA
- Single AZ only
- Cheaper but riskier

Use cases:
- Backups
- Disaster recovery copies

---

## Glacier Storage Classes

Used for archival and long-term storage.

### Glacier Instant Retrieval
- Millisecond access
- Minimum 90 days storage

### Glacier Flexible Retrieval
- Retrieval time:
  - Expedited (minutes)
  - Standard (hours)
  - Bulk (longer but cheaper)

### Glacier Deep Archive
- Very low cost
- Retrieval takes 12–48 hours
- Minimum 180 days

---

## Intelligent-Tiering

Automatically moves data between storage tiers based on access patterns.

- No retrieval fees
- Small monitoring cost

Tiers include:

- Frequent Access
- Infrequent Access (after 30 days)
- Archive Instant (after 90 days)
- Archive / Deep Archive (optional)

---

## S3 Express One Zone

High-performance storage class:

- Single AZ
- Very low latency (milliseconds)
- Handles very high request rates

Best for:

- AI/ML workloads
- Real-time processing
- High-performance computing

Trade-off:
- Not multi-AZ (lower resilience)

---

## Summary Insight

S3 is:

- Highly durable
- Flexible with multiple storage classes
- Secure with layered access control
- Suitable for both simple and complex architectures



