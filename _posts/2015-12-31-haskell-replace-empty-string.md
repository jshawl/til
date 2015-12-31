---
layout: post
title: "Remove spaces from String in Haskell"
---

Today I learned how to replace a space with an empty string in Haskell:

{% highlight haskell %}
main = do
  print removeSpaces "jesse is so cool"

removeSpaces = filter isLetter
{% endhighlight %}