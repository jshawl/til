---
layout: post
---

Today I learned how to build a basic real-time chat application using websockets
and a gem named Faye.

![](/til/img/faye.gif)

Faye is a publish-subscribe messaging system that allows for plug-n-play socket
connections for real time apps.

You can check out the project here: <https://github.com/jshawl/rails-chat>

But the best parts are in the [create.js.erb](https://github.com/jshawl/rails-chat/blob/9e663207bacedd39e33d65a08bf87d44a6820f2c/app/views/messages/create.js.erb#L1) file,
where the broadcast method just makes a post request to our faye server instance:

```ruby
def broadcast( channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse('http://localhost:9292/faye')
    Net::HTTP.post_form(uri, :message => message.to_json)
end
```

in helpers/application_helper.rb

There is currently a security flaw where anyone can just make a post request to the faye server. I was
following along the [Messaging with Faye](http://railscasts.com/episodes/260-messaging-with-faye) railscast,
but ran into a bit of trouble regarding the authentication.

I'd like to revisit this and add user authentication if time permits.