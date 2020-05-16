---
layout: post
title: "restart passenger apps when request number reaches"
date: 2018-04-03 15:19:06
---

restart passenger apps when request number reaches N

```
passenger_max_requests 2000;
```

The memory in my rails app kept growing. I think I've got a memory leak
somewhere, but restarting the application every 2000 processed requests helps
keep memory per-app under the 300M mark:

```
Version : 5.2.2
Date    : 2018-04-03 20:20:31 +0000
Instance: j3FlBJ7f (nginx/1.12.2 Phusion_Passenger/5.2.2)

----------- General information -----------
Max pool size : 6
App groups    : 1
Processes     : 6
Requests in top-level queue : 0

----------- Application groups -----------
/var/www/updog (production):
  App root: /var/www/updog
  Requests in queue: 9
  * PID: 26857   Sessions: 0       Processed: 1846    Uptime: 1h 34m 20s
    CPU: 1%      Memory  : 359M    Last used: 5s ago
  * PID: 1550    Sessions: 1       Processed: 881     Uptime: 1h 26m 32s
    CPU: 0%      Memory  : 239M    Last used: 1s ago
  * PID: 27389   Sessions: 0       Processed: 525     Uptime: 1h 7m 24s
    CPU: 0%      Memory  : 236M    Last used: 5s ago
  * PID: 16721   Sessions: 0       Processed: 217     Uptime: 38m 34s
    CPU: 0%      Memory  : 230M    Last used: 4s ago
  * PID: 22002   Sessions: 0       Processed: 63      Uptime: 28m 13s
    CPU: 0%      Memory  : 233M    Last used: 17s ago
  * PID: 31707   Sessions: 0       Processed: 22      Uptime: 8m 34s
    CPU: 0%      Memory  : 173M    Last used: 18s ago
```

If/when I upgrade to passenger enterprise, I'll be able to restart apps when
they reach a certain memory threshold.
