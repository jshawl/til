---
layout: post
---

My `rails g migration` command was hanging with no errors or output.

The solution was that `spring` had lost the connection to my rails app:

```
$ spring stop
```


[more here](http://www.dixis.com/?p=754)
