# Amazon Route 53 & DNS – Notes

---

# 🌐 What is DNS?

DNS (Domain Name System) converts human-readable domain names into IP addresses.

Example:
[www.example.com](http://www.example.com) → 93.184.216.34

Think of DNS as a phonebook of the internet.

---

# 🧠 DNS Structure

Example URL:
https://api.shop.example.com/products?id=10

Breakdown:

Protocol | Subdomain | Domain | TLD
https:// | api.shop  | example | .com

---

## 📌 FQDN (Fully Qualified Domain Name)

api.shop.example.com.

* Full domain name
* Ends with "." (root)

---

## 📌 DNS Hierarchy

```
                (Root)
                  │
        ┌─────────┴─────────┐
       .com      .org      .net
        │
    example.com
        │
    shop.example.com
        │
 api.shop.example.com
```

---

# 📚 Terminology

* Domain Registrar → where you buy domain (Route53, GoDaddy)
* DNS Records → mappings (A, CNAME, etc.)
* Name Server → resolves queries
* TLD → .com, .org
* SLD → example.com
* Zone File → list of records

---

# ☁️ Amazon Route 53

Managed DNS service by AWS.

Features:

* Highly available
* Scalable
* Authoritative DNS
* Health checks
* Domain registration

---

# 📄 DNS Records

Each record defines how traffic is handled.

Contains:

* Name → app.example.com
* Type → A / CNAME
* Value → IP or hostname
* TTL → cache time

---

## 🔑 Record Types

* A → IPv4
* AAAA → IPv6
* CNAME → domain → domain
* NS → name servers

---

# 🔄 CNAME vs Alias

CNAME:

* Only for subdomains
* Points to another hostname

Alias:

* AWS-specific
* Works for root domain
* Points to AWS resources
* No cost

---

# 🗂️ Hosted Zones

Container for DNS records.

Public:

* internet accessible

Private:

* only inside VPC

---

# ⏱️ TTL

* High TTL → less DNS traffic, slower updates
* Low TTL → faster updates, more cost

---

# 🔀 Routing Policies

DNS doesn’t route traffic — it only answers queries.

---

## Simple

* One resource

## Weighted

* Traffic split by percentage

## Latency

* Closest region

## Geolocation

* Based on user location

## Failover

* Primary + backup

## Multi-value

* Returns multiple healthy IPs

---

# ❤️ Health Checks

Route53 checks if your app is healthy.

```
   Route53
      │
      ▼
   Server
   /     \
 OK      FAIL
```

* Uses HTTP/TCP
* Must return 2xx or 3xx

---

# 🔗 Alias Targets

Can point to:

* Load Balancer
* CloudFront
* API Gateway
* S3 Website

Cannot point to EC2 DNS directly.

---

# 🌐 Domain vs DNS

* Domain Registrar → buys domain
* DNS Service → manages records

You can mix them.

---

# 🔄 Hybrid DNS

Used between:

* AWS VPC
* On-prem systems

---

## Flow Example

```
On-Prem → AWS Resolver → Private Zone
```

---

# 🧠 Summary

* DNS = name → IP
* Route53 = AWS DNS service
* Alias > CNAME (AWS)
* Health checks = failover
* Routing policies control responses

---

# 🚀 Simple Flow

User → DNS → gets IP → connects to server

DNS only answers:
“Where should I go?”

