---
layout: post
title: "caching with nginx and rails"
date: 2018-03-29 13:20:46
---

I couldn't have done it without https://mattbrictson.com/nginx-reverse-proxy-cache

but I did. I was thinking about using DigitalOcean's Load Balancer offering
but was unhappy with not having a caching layer before the load balancer.

I ended up sending the `expires_in` in one controller method (#load):

```rb
  expires_in(5.minutes, public: true)
```

```txt
upstream rails {
  server unix:/path/to/.unicorn.sock fail_timeout=0;
}

server {
  listen 80 default deferred; # for Linux
  root /path/to/app/current/public;
  try_files $uri/index.html $uri.html $uri @app;

  location @app {
    # Standard reverse proxy stuff
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://rails;

    # Reverse proxy cache
    proxy_cache default;
    proxy_cache_lock on;
    proxy_cache_use_stale updating;
    add_header X-Cache-Status $upstream_cache_status;
  }

  error_page 500 502 503 504 /500.html;
  location = /500.html {
    root /path/to/app/current/public;
  }
}
```

In doing this, I actually realized that my current caching situation isn't working
as expected.

I think spinning up an additional \$20/m server will actually reduce my overall
costs. Radical
