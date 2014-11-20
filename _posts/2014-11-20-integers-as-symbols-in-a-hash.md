---
layout: post
title: integers as symbols in a hash
---

This gives a syntax error:

    hash = {
      90210: 'Beverly Hills, CA',
      20002: 'Washington, DC'
    }

Prefixing the keys with an underscore allows symbols to be used as the key with this hash syntax.

    hash = {
      _90210: 'Beverly Hills, CA',
      _20002: 'Washington, DC'
    }


 
