# step-functions-cognito.md

```md
# AWS Step Functions

## What are Step Functions?

AWS Step Functions orchestrate serverless workflows visually.

---

## Workflow Example

```text
Start
  │
  ▼
Validate Request
  │
  ▼
Process Payment
  │
  ▼
Update Database
  │
  ▼
Send Notification
  │
  ▼
End
````

---

## Features

* Sequential workflows
* Parallel execution
* Error handling
* Retry logic
* Timeouts
* Human approval workflows

---

## Integrations

Step Functions integrate with:

* Lambda
* ECS
* SQS
* SNS
* API Gateway
* EC2

---

# Amazon Cognito

## What is Cognito?

Amazon Cognito provides authentication, authorization, and user management for applications.

---

# Cognito User Pools

## Purpose

Provides user authentication for:

* Web applications
* Mobile applications

---

## Features

* User sign-up/sign-in
* Password reset
* MFA
* Email verification
* Social login support

---

## Supported Identity Providers

* Google
* Facebook
* SAML
* OpenID Connect

---

## User Pool Flow

```text
User
  │
  ▼
Cognito User Pool
  │
  ▼
Authenticated Session
```

---

# Cognito Identity Pools

## Purpose

Provides temporary AWS credentials to authenticated users.

---

## Use Cases

* Direct S3 access
* Access AWS APIs
* Mobile applications

---

## Identity Pool Flow

```text
User Login
    │
    ▼
Cognito Identity Pool
    │
    ▼
Temporary AWS Credentials
    │
    ▼
Access AWS Services
```

```
```
