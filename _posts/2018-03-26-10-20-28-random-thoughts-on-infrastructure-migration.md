---
layout: post
title: "random thoughts on infrastructure migration"
date: 2018-03-26 10:20:28
published: false
---

# Before

Updog's entire infrastructure existed on a single
hand-configured VPS (also known as a snowflake server)

The stack looked like:

- nginx
- unicorn
- rails
- redis
- postgresql

Deployments are slow and configuration changes are terrifying
at best and cause outages at worst.

# After

The future of Updog's stack will be a multi-tenant architecture:

```
Floating IP
  /
HAProxy
Nginx


Rails (n) Application Servers
  powered by Passenger
   |
Postgres
```
