              ┌──────────────────────────┐
              │        Internet          │
              │       (Clients)          │
              └──────────┬──────────────┘
                         │ HTTP (80)
                         ▼
        ┌──────────────────────────────────┐
        │     Application Load Balancer    │
        │          (ALB - L7)              │
        └──────────┬──────────────┬───────┘
                   │              │
        Forward to │              │ Forward to
                   ▼              ▼
     ┌──────────────────┐   ┌──────────────────┐
     │    EC2 Instance  │   │    EC2 Instance  │
     │      (vm1)       │   │      (vm2)       │
     │ t3.micro         │   │ t3.micro         │
     │ Apache Web       │   │ Apache Web       │
     │ "Hello + IP"     │   │ "Hello + IP"     │
     └──────────────────┘   └──────────────────┘
                   │              │
                   └──────┬───────┘
                          │
                          ▼
        ┌──────────────────────────────────┐
        │         Target Group             │
        │   (Health Checks + Routing)      │
        └──────────────────────────────────┘