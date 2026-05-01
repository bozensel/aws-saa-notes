# Amazon S3 – Security

## Object Encryption in S3

Amazon S3 supports multiple encryption approaches to protect your data at rest. These methods differ in how encryption keys are managed and where encryption occurs.

### Server-Side Encryption (SSE)

With server-side encryption, Amazon S3 encrypts your data after receiving it and decrypts it before returning it.

#### SSE-S3 (S3 Managed Keys)
- Uses encryption keys fully managed by AWS
- Default encryption method for new buckets and objects
- Uses AES-256 encryption
- No additional configuration required in most cases
- Optional header:
x-amz-server-side-encryption: AES256

#### SSE-KMS (AWS KMS Managed Keys)
- Uses AWS Key Management Service (KMS) for key management
- Provides more control and auditing via CloudTrail
- Requires header:
x-amz-server-side-encryption: aws:kms
- **Important limitation:**
- Each upload/download interacts with KMS APIs
- Subject to KMS request quotas (e.g., 5,500–30,000 req/sec depending on region)

#### SSE-C (Customer-Provided Keys)
- You manage your own encryption keys
- AWS does NOT store your keys
- Keys must be sent with every request
- HTTPS is mandatory
- More complex and less commonly used

---

### Client-Side Encryption

- Data is encrypted before being sent to S3
- Decryption also happens on the client side
- You fully control keys and encryption logic
- Typically implemented using SDKs or encryption libraries
Client → Encrypt → S3 Bucket → Decrypt → Client

---

## Encryption in Transit (SSL/TLS)

- Protects data while moving between client and S3
- Two endpoints:
  - HTTP (not secure)
  - HTTPS (secure, recommended)
- HTTPS is required for SSE-C
- Most AWS tools default to HTTPS

---

## Default Encryption vs Bucket Policies

- Default encryption (e.g., SSE-S3) applies automatically to new objects
- Bucket policies can enforce stricter rules:
  - Reject uploads without encryption headers
- Important: Bucket policies are evaluated **before** default encryption

---

## Cross-Origin Resource Sharing (CORS)

### What is CORS?

CORS allows web browsers to request resources from a different origin.

- Origin = protocol + domain + port  
  Example: `https://example.com`
- Without proper headers, cross-origin requests are blocked

### S3 and CORS

- Required when frontend apps access S3 from different domains
- You must configure CORS rules on the bucket
- Can allow:
  - Specific origins
  - All origins (`*`)

---

## MFA Delete

Multi-Factor Authentication (MFA) adds an extra layer of protection for sensitive actions.

### Required for:
- Permanently deleting object versions
- Disabling versioning

### Not required for:
- Enabling versioning
- Listing object versions

### Notes:
- Versioning must be enabled
- Only the root account can enable/disable MFA Delete

---

## S3 Access Logs

- Records all requests made to an S3 bucket
- Includes both successful and failed access attempts
- Logs are stored in another S3 bucket (same region)

### Use cases:
- Auditing
- Security analysis
- Usage tracking

### Important Warning:
Do NOT log into the same bucket being monitored → causes infinite logging loop.

---

## Pre-Signed URLs

Pre-signed URLs allow temporary access to S3 objects.

### Key Features:
- Time-limited access
- Uses permissions of the creator
- Supports:
  - GET (download)
  - PUT (upload)

### Expiration:
- Console: 1 minute to 12 hours
- CLI/SDK: up to 7 days

### Common Use Cases:
- Temporary file sharing
- Secure downloads
- Upload access without exposing credentials

---

## S3 Glacier Vault Lock

- Implements WORM (Write Once Read Many)
- Prevents deletion or modification of data
- Policies can be locked permanently

### Use cases:
- Compliance (e.g., financial, legal data retention)

---

## S3 Access Points

Access Points simplify managing access to S3 buckets.

### Features:
- Each access point has:
  - Its own DNS name
  - Its own access policy
- Helps manage permissions at scale

---

### VPC Access Points

- Restrict access to within a VPC
- Requires a VPC Endpoint:
  - Gateway Endpoint OR Interface Endpoint
- Endpoint policies must allow access
VPC → Endpoint → Access Point → S3 Bucket

---

## S3 Object Lambda

S3 Object Lambda allows you to modify objects dynamically when they are retrieved.

### How it works:
Client → S3 Access Point → Lambda → Modified Object → Client

### Use Cases:
- Mask sensitive data (PII)
- Convert formats (XML → JSON)
- Resize or watermark images dynamically

---

## Summary

S3 security combines multiple layers:

- Encryption (at rest & in transit)
- Access control (IAM, bucket policies, access points)
- Monitoring (logs, CloudTrail)
- Advanced protections (MFA Delete, Vault Lock)

Choosing the right combination depends on your security, compliance, and operational requirements.


