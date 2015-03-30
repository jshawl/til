---
layout: post
---

Today I learned that if you call a method such that the last argument in the method’s argument list is a hash, Ruby 
doesn’t require you to write the hash with curly braces.

I’ve seen this most recently with ActiveRecord validations:

{% highlight ruby %}
validates :some_column, :presence => true
{% endhighlight %}

Where `:presence => true` is the hash in question.