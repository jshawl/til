---
layout: post
---

Today I learned two things!

First,

```bash
$ rails s -p 3333
```

starts the development server on the given port,
where 3333 is any arbitrary number greater than 1024, 
or you'll need sudo permissions.

Second, there is *no* setup to access development servers
by ip on my digital ocean droplets.

i.e. I can visit <http://162.243.23.12:3333/> in my browser, when I run the
above command on my development server. 

The above link will last as long as my tmux session persists. 

This makes me want to use a droplet as a dedicated localhost
development environment.