# AWS Core Concepts (Terminology)

---

## ☁️ AWS (Amazon Web Services)
Cloud computing platform that provides on-demand IT resources over the internet with pay-as-you-go pricing.

---

## 🚀 Cloud Computing
Delivery of computing services (servers, storage, databases, networking) over the internet instead of on-premises infrastructure.

---

## 🌍 AWS Global Infrastructure
AWS infrastructure is composed of:

- Regions
- Availability Zones (AZs)
- Data Centers
- Edge Locations (Points of Presence)

---

## 🌐 Region
A geographical area that contains multiple Availability Zones.

- Example: `us-east-1`, `eu-west-1`
- Fully isolated from other regions
- Most AWS services are region-scoped

---

## 🏗️ Availability Zone (AZ)
One or more physically separate data centers within a region.

- Example: `us-east-1a`, `us-east-1b`
- Typically 3+ AZs per region
- Connected with low-latency, high-bandwidth networking
- Used for high availability and fault tolerance

---

## ⚡ Edge Location (Point of Presence)
Global infrastructure locations used to cache and deliver content closer to users.

- Used mainly by CDN services (e.g., CloudFront)
- Reduces latency for end users
- Over 400+ locations globally

---

## 🌍 Global Services
AWS services that operate across all regions:

- IAM (Identity and Access Management)
- Route 53 (DNS)
- CloudFront (CDN)
- AWS WAF (Web Application Firewall)

---

## 📍 Regional Services
AWS services that are deployed inside a specific region:

- EC2 (Virtual servers)
- Lambda (Serverless functions)
- RDS (Databases)
- S3 (Object storage – regionally hosted)

---

## 🔑 Key Terminology Summary

- Region → geographic area
- AZ → isolated data center inside region
- Edge Location → content delivery point
- Global service → not tied to region
- Regional service → deployed in a region

---
