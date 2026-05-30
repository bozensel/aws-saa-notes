# Advanced Identity and Multi-Account Management in AWS

## Overview

As organizations grow, managing multiple AWS accounts, identities, permissions, and compliance requirements becomes increasingly important. AWS provides several services and features that help centralize identity management, enforce security controls, and govern multi-account environments.

---

# AWS Organizations

AWS Organizations is a global service that allows centralized management of multiple AWS accounts.

## Core Concepts

* **Management Account**: The primary account that controls the organization.
* **Member Accounts**: Additional AWS accounts managed under the organization.
* Each AWS account can belong to only one organization.
* Consolidated billing allows all accounts to share a single payment method.

## Benefits

### Cost Optimization

* Consolidated billing across accounts
* Shared Reserved Instance discounts
* Shared Savings Plans benefits
* Volume-based pricing advantages

### Governance

* Centralized account management
* Automated account creation through APIs
* Consistent security policies
* Centralized logging and monitoring

### Recommended Multi-Account Strategy

```text
AWS Organization
│
├── Security OU
│   ├── Security Account
│   └── Logging Account
│
├── Production OU
│   ├── Prod Account 1
│   └── Prod Account 2
│
├── Development OU
│   ├── Dev Account 1
│   └── Dev Account 2
│
└── Shared Services OU
```

### Best Practices

* Separate workloads using multiple accounts
* Apply consistent tagging standards
* Centralize CloudTrail logs
* Centralize CloudWatch Logs
* Use cross-account IAM roles for administration

---

# Service Control Policies (SCPs)

Service Control Policies provide organization-wide permission boundaries.

## Key Characteristics

* Applied at Organizational Units (OUs) or Accounts
* Restrict permissions regardless of IAM permissions
* Do not grant permissions
* Do not affect the management account
* Require explicit allow permissions throughout the hierarchy

### SCP Evaluation Model

```text
Root
 │
 ├── OU
 │    │
 │    └── Account
 │
Permission must be allowed
at every level in the path.
```

---

# AWS Organizations Tag Policies

Tag Policies help standardize resource tagging across an organization.

## Benefits

* Consistent resource categorization
* Improved cost allocation
* Better reporting
* Attribute-Based Access Control (ABAC)
* Compliance monitoring

## Features

* Define approved tag keys
* Define acceptable tag values
* Generate compliance reports
* Monitor violations using EventBridge

Example:

```text
Environment = Production | Development | Test
CostCenter  = 1001 | 1002 | 1003
Owner       = TeamA | TeamB
```

---

# Resource Policies and aws:PrincipalOrgID

AWS resource policies can restrict access to accounts within a specific AWS Organization.

Example use cases:

* S3 bucket access
* SNS topics
* SQS queues
* Lambda functions

Condition Example:

```json
"Condition": {
  "StringEquals": {
    "aws:PrincipalOrgID": "o-xxxxxxxxxx"
  }
}
```

This ensures only accounts belonging to your organization can access the resource.

---

# IAM Roles vs Resource-Based Policies

AWS supports two primary methods for cross-account access.

## Option 1: IAM Roles

Users or services assume a role in another account.

```text
Account A User
      │
Assume Role
      │
      ▼
Account B Role
```

### Characteristics

* Original permissions are replaced
* Temporary credentials are used
* Common for administrative access

---

## Option 2: Resource-Based Policies

Permissions are attached directly to resources.

```text
Account A User
       │
       ▼
S3 Bucket Policy
       │
       ▼
Account B Resource
```

### Characteristics

* User keeps existing permissions
* Resource grants additional access
* Common with S3, SNS, SQS, Lambda

---

# EventBridge Security Model

EventBridge requires permissions to invoke target resources.

## Resource-Based Policies

Used for:

* Lambda
* SNS
* SQS
* API Gateway
* S3

## IAM Roles

Used for:

* ECS Tasks
* EC2 Auto Scaling
* Systems Manager

```text
EventBridge Rule
        │
        ▼
Permission Check
        │
 ┌──────┴──────┐
 │             │
Resource   IAM Role
Policy
```

---

# IAM Permission Boundaries

Permission Boundaries define the maximum permissions an IAM user or role can receive.

## Purpose

Delegated administration without privilege escalation.

### Example

```text
IAM Policy
     ∩
Permission Boundary
     =
Effective Permissions
```

Even if a user attaches AdministratorAccess, the boundary still limits what can be performed.

## Common Use Cases

### Developer Self-Service

Allow developers to:

* Create roles
* Attach policies

Prevent them from:

* Becoming administrators
* Modifying security controls

### Delegated Administration

Allow department administrators to manage resources within approved limits.

### SCP + Permission Boundary

```text
SCP
 ∩
Permission Boundary
 ∩
IAM Policy
 =
Final Permissions
```

---

# AWS IAM Identity Center

IAM Identity Center is the successor to AWS Single Sign-On (SSO).

## Purpose

Provide centralized authentication and authorization across:

* AWS Accounts
* Cloud Applications
* SAML Applications
* Windows Instances

## Supported Identity Sources

### Built-In Identity Store

Managed directly within AWS.

### External Providers

* Active Directory
* Okta
* OneLogin
* Other SAML providers

---

# Permission Sets

Permission Sets define AWS access levels.

```text
User
 │
 ▼
Permission Set
 │
 ▼
AWS Account
```

A Permission Set contains one or more IAM policies.

Examples:

* Administrator
* ReadOnly
* Developer
* Security Auditor

---

# Application Assignments

IAM Identity Center can provide SSO access to applications such as:

* Salesforce
* Microsoft 365
* Box
* ServiceNow

Authentication is handled through SAML 2.0.

---

# Attribute-Based Access Control (ABAC)

ABAC grants permissions based on user attributes.

Example attributes:

* Department
* Cost Center
* Location
* Job Title

```text
User Attribute
CostCenter=1001
        │
        ▼
Access Resources
Tagged CostCenter=1001
```

Benefits:

* Simplified administration
* Dynamic access management
* Reduced policy complexity

---

# Microsoft Active Directory (AD)

Active Directory is Microsoft's centralized identity management platform.

## Stores

* Users
* Computers
* Printers
* File Shares
* Security Groups

## Structure

```text
Forest
 │
 ├── Tree
 │    ├── OU
 │    └── OU
 │
 └── Tree
```

Benefits include centralized authentication and authorization.

---

# AWS Directory Service

AWS provides managed directory solutions.

## AWS Managed Microsoft AD

Fully managed Active Directory running in AWS.

Features:

* Native Microsoft AD
* Trust relationships
* MFA support

---

## AD Connector

Acts as a proxy to an existing on-premises AD.

```text
AWS Resources
      │
AD Connector
      │
On-Prem AD
```

Users remain managed on-premises.

---

## Simple AD

A lightweight directory service compatible with Active Directory concepts.

Limitations:

* Cannot establish trust relationships
* Not suitable for complex enterprise environments

---

# IAM Identity Center and Active Directory

Two integration models are available.

## AWS Managed Microsoft AD

Direct integration with IAM Identity Center.

```text
IAM Identity Center
         │
         ▼
AWS Managed Microsoft AD
```

---

## Self-Managed Active Directory

Uses:

1. AWS Managed Microsoft AD trust relationship
2. AD Connector

```text
Self-Managed AD
        │
 AD Connector
        │
 IAM Identity Center
```

---

# AWS Control Tower

AWS Control Tower simplifies multi-account governance and security.

Built on top of AWS Organizations.

## Capabilities

* Automated account provisioning
* Security baseline deployment
* Governance enforcement
* Compliance monitoring

### Architecture

```text
AWS Control Tower
        │
        ▼
AWS Organizations
        │
 ┌──────┼──────┐
 │      │      │
Prod   Dev   Security
```

---

# Control Tower Guardrails

Guardrails provide continuous governance.

## Preventive Guardrails

Implemented using SCPs.

Examples:

* Restrict AWS Regions
* Block specific services

```text
SCP
 │
Prevent Action
```

---

## Detective Guardrails

Implemented using AWS Config.

Examples:

* Detect unencrypted resources
* Detect missing tags
* Detect public access

```text
Resource Change
       │
       ▼
AWS Config
       │
       ▼
Compliance Alert
```

---

# Summary

| Service                  | Purpose                             |
| ------------------------ | ----------------------------------- |
| AWS Organizations        | Multi-account management            |
| SCPs                     | Account-level restrictions          |
| Tag Policies             | Standardized tagging                |
| IAM Roles                | Cross-account access                |
| Resource Policies        | Resource-level permissions          |
| Permission Boundaries    | Maximum IAM permissions             |
| IAM Identity Center      | Centralized SSO                     |
| AWS Managed Microsoft AD | Managed Active Directory            |
| AD Connector             | Connect AWS to on-prem AD           |
| AWS Control Tower        | Governance and account provisioning |
| Guardrails               | Compliance enforcement              |

These services work together to create a secure, scalable, and well-governed AWS environment suitable for enterprises operating multiple AWS accounts.



