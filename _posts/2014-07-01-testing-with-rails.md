---
layout: post
title: "Testing with Rails"
---

Today I learned how to write tests for a rails application. My sample
app had three models to start: `Painting`, `Artist`, and `Museum`, where `Painting` `belongs_to`
both `Artist` and `Museum`.

I was having trouble with what seemed like an arbitrary SQLite exception,
but I realized the data in my fixtures yaml files inaccurately represented my
schema. I'm not sure if the fixtures were generated during an earlier scaffold 
before the associations were made, though I'll have to investigate.

Anyway, my app was working well except for the fixtures files, so I found a way
to generate the fixtures files from my database:

```ruby
desc 'Create YAML test fixtures from data in an existing database.  
Defaults to development database.  Set RAILS_ENV to override.'

task :extract_fixtures => :environment do
  sql  = "SELECT * FROM %s"
  skip_tables = ["schema_info"]
  ActiveRecord::Base.establish_connection
  (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
    i = "000"
    File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
      data = ActiveRecord::Base.connection.select_all(sql % table_name)
      file.write data.inject({}) { |hash, record|
        hash["#{table_name}_#{i.succ!}"] = record
        hash
      }.to_yaml
    end
  end
end
```

source - <http://dzone.com/snippets/create-yaml-test-fixtures>

I added the above contents to my Rakefile and ran

    $ rake extract_fixtures

to create the appropriate fixtures. Now all is well and I can run

    $ rake test test/models/painting_test.rb test_the_truth

and the tests run successfully!

Here is the contents of my `painting_test.rb` file:

```ruby
require 'test_helper'

class PaintingTest < ActiveSupport::TestCase
   def test_the_truth
     assert true
   end
end
```

It's a bit of a basic hello-world example for writing unit tests, but hey, I got it working!

I've been following the testing guide here - <http://guides.rubyonrails.org/testing.html>
and will work on some more advanced tests in the near future.