# AWS IAM (Identity and Access Management) – Summary

---

## 🔐 What is IAM?

AWS Identity and Access Management (IAM) is a **global AWS service** used to control access to AWS resources securely.

It allows you to:
- Manage users and their permissions
- Control access to AWS services
- Apply security best practices like least privilege

---

## 👤 Users & Groups

### Users
- Represents an individual identity in AWS
- Can access AWS via console, CLI, or SDK
- Should not use the root account for daily tasks

### Groups
- Collection of IAM users
- A user can belong to multiple groups
- Groups cannot contain other groups

👉 Best practice: Assign permissions to groups, not individual users

---

## 🛡️ Permissions (Policies)

Permissions in IAM are defined using **JSON policies**.

Key principle:
👉 **Least Privilege** → give only the permissions that are required

Policies are attached to:
- Users
- Groups
- Roles

---

## 📄 Policy Structure (Conceptual)

A policy defines:
- Version (policy language version)
- Statements (one or more rules)

Each statement includes:
- Effect: Allow or Deny
- Action: what actions are permitted
- Resource: which AWS resources are affected
- Condition: optional restrictions

---

## 🔐 Multi-Factor Authentication (MFA)

MFA adds an extra layer of security:
👉 password + physical/virtual device

Why it matters:
- Protects account even if password is stolen
- Strongly recommended for root and IAM users

Common MFA types:
- Virtual MFA apps (e.g., Google Authenticator, Authy)
- Hardware security keys (e.g., YubiKey)
- Hardware key fobs

---

## 🔑 Access Methods to AWS

Users can access AWS in three ways:

### 1. AWS Management Console
- Web interface
- Protected by password + MFA

### 2. AWS CLI
- Command-line tool
- Uses access keys
- Useful for automation and scripting

### 3. AWS SDK
- Programmatic access via code
- Used in applications (Python, Java, Node.js, etc.)
- CLI itself is built on SDKs

---

## 🔐 Access Keys

- Used for CLI and SDK access
- Consist of:
  - Access Key ID (username-like)
  - Secret Access Key (password-like)
- Must be kept private and never shared

---

## 🧩 IAM Roles

Roles allow AWS services to act on your behalf.

Common use cases:
- EC2 instance roles
- Lambda execution roles
- AWS service permissions (e.g., CloudFormation)

👉 Roles eliminate the need for hardcoded credentials

---

## 📊 IAM Security & Audit Tools

### IAM Credentials Report
- Account-level report
- Shows all users and credential status

### IAM Access Advisor
- User-level view
- Shows which services a user accessed and when

👉 Used for reviewing and reducing unnecessary permissions

---

## 🧠 IAM Best Practices

- Avoid using root account (except setup)
- One user per physical person
- Use groups for permission management
- Enforce strong password policies
- Enable MFA for all users
- Use roles instead of long-term credentials
- Use access keys only for CLI/SDK
- Regularly audit permissions
- Never share credentials or access keys

---

## 📌 IAM Summary

- Users → individual identities
- Groups → collection of users
- Policies → define permissions (JSON)
- Roles → permissions for AWS services
- Security → MFA + password policies
- CLI/SDK → programmatic access using keys
- Auditing → Credentials Report + Access Advisor
