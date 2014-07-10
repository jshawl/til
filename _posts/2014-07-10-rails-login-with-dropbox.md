---
layout: post
---

Today I learned how to implement the oauth flow in rails using
the Dropbox API.

It's a work in progress, but you can check out the current state
of the project here <https://github.com/jshawl/ritly/tree/b1c66f8e2147cb80a979e9064a10d45445191136>

Since Dropbox provides a Ruby SDK, starting the oauth flow is as easy as dropping

```ruby
DropboxOAuth2Flow.new(ENV['DB_APP_KEY'], ENV['DB_APP_SECRET'], redirect_uri, session, :dropbox_auth_csrf_token)
```

into one of your controller's methods.

Additionally, I'm using [dotenv](https://github.com/bkeepers/dotenv) to store the sensitive key and 
secret provided by Dropbox when I registered the application.

