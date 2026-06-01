# AWS Security & Encryption Guide

This document provides summary of AWS encryption, key management, secrets management, certificates, web security, DDoS protection, and threat detection services.

## Topics Covered

- Encryption Fundamentals
- AWS KMS
- KMS Multi-Region Keys
- SSM Parameter Store
- AWS Secrets Manager
- AWS Certificate Manager (ACM)
- CloudHSM
- AWS WAF
- AWS Shield
- AWS Firewall Manager
- DDoS Protection Best Practices
- Amazon GuardDuty
- Amazon Inspector
- AWS Macie

## Encryption Fundamentals

### Encryption in Transit
Data is encrypted while moving across networks using TLS/SSL. This protects communications from interception and man-in-the-middle attacks.

### Encryption at Rest
Data is encrypted when stored. AWS services decrypt data only when authorized access occurs.

### Client-Side Encryption
Data is encrypted before leaving the client and remains encrypted in transit and storage. Only authorized clients can decrypt it.

---

## AWS KMS (Key Management Service)

AWS KMS provides centralized key management and integrates with most AWS services.

### Benefits
- Centralized encryption key management
- IAM integration
- CloudTrail auditing
- Native AWS service integration
- API access via SDK and CLI

### Key Types

#### Symmetric Keys
- Single key for encryption and decryption
- Used by most AWS services

#### Asymmetric Keys
- Public/private key pairs
- Supports encrypt/decrypt and sign/verify workflows

### Key Categories
- AWS-Owned Keys
- AWS-Managed Keys
- Customer-Managed Keys
- Imported Customer Keys

### Key Rotation
- AWS-managed keys rotate automatically yearly
- Customer-managed keys support automatic and manual rotation
- Imported keys require manual rotation

---

## KMS Multi-Region Keys

Multi-Region Keys maintain identical key material across multiple AWS Regions.

Benefits:
- Regional encryption and decryption
- Reduced latency
- Simplified global architectures

Use Cases:
- DynamoDB Global Tables
- Aurora Global Databases
- Global client-side encryption

---

## Systems Manager Parameter Store

Parameter Store securely stores configuration values and secrets.

Features:
- Optional KMS encryption
- Version tracking
- IAM access controls
- EventBridge integration
- CloudFormation support

Example Hierarchy:

```text
/application
├── dev
│   ├── db-url
│   └── db-password
└── prod
    ├── db-url
    └── db-password
```

---

## AWS Secrets Manager

Secrets Manager is designed specifically for secret storage and rotation.

Features:
- Automatic rotation
- Lambda integration
- RDS integration
- KMS encryption
- Multi-Region secret replication

---

## AWS Certificate Manager (ACM)

ACM simplifies certificate lifecycle management.

Features:
- Public and private certificates
- Automatic renewal
- Integration with ALB, NLB, CloudFront, and API Gateway

Validation Options:
- DNS Validation (recommended)
- Email Validation

---

## CloudHSM

CloudHSM provides dedicated hardware security modules.

Features:
- Customer-controlled keys
- FIPS 140-2 Level 3 compliance
- High availability across multiple AZs
- KMS custom key store integration

---

## AWS WAF

AWS WAF protects web applications from Layer 7 attacks.

Supported Services:
- Application Load Balancer
- API Gateway
- CloudFront
- AppSync
- Cognito

Protection Features:
- SQL injection protection
- Cross-site scripting protection
- IP filtering
- Geo restrictions
- Rate limiting

---

## AWS Shield

AWS Shield protects against DDoS attacks.

### Shield Standard
Included automatically for all AWS customers.

### Shield Advanced
Adds:
- Advanced mitigation
- Cost protection
- AWS DDoS Response Team support
- Automated WAF integration

---

## AWS Firewall Manager

Firewall Manager centrally manages security policies across AWS Organizations.

Supported Controls:
- AWS WAF
- AWS Shield Advanced
- Security Groups
- AWS Network Firewall
- Route 53 DNS Firewall

---

## DDoS Protection Architecture

```text
Users
   |
CloudFront / Global Accelerator
   |
Load Balancer
   |
Application
```

Recommended Services:
- CloudFront
- Global Accelerator
- Route 53
- Elastic Load Balancing
- Auto Scaling
- AWS WAF

---

## Amazon GuardDuty

GuardDuty provides intelligent threat detection.

Monitored Sources:
- CloudTrail
- VPC Flow Logs
- DNS Logs
- S3 Activity
- EKS Activity
- RDS Activity
- Lambda Activity

Capabilities:
- Threat detection
- Anomaly detection
- Cryptocurrency mining detection
- EventBridge integration

---

## Amazon Inspector

Inspector performs automated vulnerability assessments.

Supported Targets:
- EC2 Instances
- ECR Container Images
- Lambda Functions

Assessment Areas:
- CVE vulnerabilities
- Network exposure
- Security risks

---

## AWS Macie

Amazon Macie helps discover and protect sensitive information stored in AWS.

Capabilities:
- PII detection
- Sensitive data discovery
- S3 data classification
- Security findings and alerts

---

## Security Services Comparison

| Service | Primary Purpose |
|-----------|------------------|
| KMS | Encryption key management |
| Parameter Store | Configuration and secret storage |
| Secrets Manager | Secret management and rotation |
| ACM | TLS certificate management |
| CloudHSM | Dedicated hardware key management |
| WAF | Web application protection |
| Shield | DDoS protection |
| Firewall Manager | Multi-account security governance |
| GuardDuty | Threat detection |
| Inspector | Vulnerability assessment |
| Macie | Sensitive data discovery |





