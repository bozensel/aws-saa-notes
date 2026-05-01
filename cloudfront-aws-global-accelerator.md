# CloudFront & Global Accelerator

## Amazon CloudFront

Amazon CloudFront is a Content Delivery Network (CDN) designed to deliver content with low latency and high performance.

### Key Features
- Caches content at global edge locations
- Improves user experience by reducing latency
- Uses a large network of Points of Presence (PoPs)
- Built-in DDoS protection via AWS Shield
- Integration with AWS WAF for security

---

## CloudFront Origins

CloudFront retrieves content from an origin. Supported origin types include:

### 1. Amazon S3
- Used for static content distribution
- Can be secured using Origin Access Control (OAC)
- Supports direct uploads via CloudFront

### 2. VPC Origins
- Used for private applications داخل VPC
- Supports:
  - Application Load Balancer (ALB)
  - Network Load Balancer (NLB)
  - EC2 instances
- No need to expose backend to the internet

### 3. Custom Origins (HTTP)
- Public ALBs or HTTP servers
- S3 static website endpoints
- Any public web server

---

## CloudFront vs S3 Cross-Region Replication

| Feature | CloudFront | S3 Cross-Region Replication |
|--------|------------|-----------------------------|
| Scope | Global | Region-to-region |
| Latency | Very low (edge caching) | Low (regional access) |
| Data freshness | Based on TTL | Near real-time |
| Use case | Static/global content | Dynamic/regional content |

---

## CloudFront with Private Backends (VPC Origin)

CloudFront can serve content from private infrastructure without exposing it publicly.

User → CloudFront Edge → Private ALB/NLB → EC2 (Private Subnet)


---

## Geo Restriction

Control access based on user location.

- **Allowlist** → Only specific countries allowed
- **Blocklist** → Specific countries denied
- Uses Geo-IP databases

### Use Cases
- Content licensing restrictions
- Regional compliance

---

## Cache Invalidation

CloudFront caches content based on TTL. If content changes:

- You can manually invalidate cache
- Options:
  - Invalidate all (`*`)
  - Invalidate specific paths (`/images/*`)

---

## Global Application Challenge

Without optimization:

User → Internet → Multiple hops → AWS Region → Application


- High latency
- Unpredictable performance

---

## Unicast vs Anycast IP

- **Unicast** → One IP = One server
- **Anycast** → Same IP across multiple locations → routes to nearest

---

## AWS Global Accelerator

AWS Global Accelerator improves performance using AWS’s global network.

### How It Works

User → Anycast IP → Edge Location → AWS Network → Application


### Key Features
- Provides 2 static Anycast IP addresses
- Routes traffic via AWS internal network
- Works with:
  - EC2
  - ALB / NLB
  - Elastic IPs
- Supports TCP and UDP traffic

---

## Benefits of Global Accelerator

### Performance
- Routes traffic to the nearest healthy endpoint
- Reduces latency

### High Availability
- Fast regional failover (< 1 minute)
- Built-in health checks

### Stability
- Static IP addresses (no DNS caching issues)

### Security
- Only 2 IPs to whitelist
- Integrated with AWS Shield

---

## Global Accelerator vs CloudFront

| Feature | CloudFront | Global Accelerator |
|--------|-----------|--------------------|
| Protocol | HTTP/HTTPS | TCP/UDP |
| Content | Cached at edge | Not cached |
| Use Case | Static + dynamic web content | Non-HTTP + performance-critical apps |
| IP Type | Dynamic DNS | Static Anycast IP |
| Examples | Websites, APIs | Gaming, VoIP, IoT |

---

## When to Use What?

### Use CloudFront if:
- You want caching
- You serve web content (HTML, images, videos)
- You need CDN capabilities

### Use Global Accelerator if:
- You need static IPs
- You use non-HTTP protocols (UDP, TCP)
- You require fast failover and consistent routing

---

## Summary

- **CloudFront** = CDN with caching and edge delivery  
- **Global Accelerator** = Network-level performance optimization using Anycast IPs  

They can also be used together for advanced architectures.





