---
layout: post
---

Today I learned the difference between rails' `has_and_belongs_to_many` and `has_many :through `.

## Has and Belongs to Many

is a bit old-school. It's the one-trick-pony for associating two models. An example 
join table might look like this.

    |---------|-------------|
    | post_id | category_id |
    |---------|-------------|
    |    1    |     14      |    
    |---------|-------------|
    |    3    |     17      |    
    |---------|-------------|

This way, you'll be able to find all posts by category and/or
all categories by post, i.e. a many to many relationship.

You won't be able to add any more columns with `has_and_belongs_to_many`, though.
It might be useful to track what time the category was added or even add a new `tag_id` column.

The solution?

## `has_many :through => `

models/collection.rb

```ruby
class Categorization < ActiveRecord::Base
  has_many :posts
  has_many :categories
end

class Post < ActiveRecord::Base
  belongs_to :category
end


class Category < ActiveRecord::Base
  belongs_to :post
end
```

That is, a `Post` has many `:categories` through categorizations.