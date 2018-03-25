require 'date'
require 'fileutils'
class Tid
  attr_reader :content
  def initialize(args, opts = {})
    @args = args
    @date = Time.now
    @opts = opts
    @content = %{---
layout: post
title:  "#{title}"
date:   #{@date.strftime('%F %H:%M:%S')}
---\n\n} + args.join(" ")
    save!
  end
  def title
    if @opts[:multiline]
      @args[0]
    else
      @args[0..6].join(' ')
    end
  end
  def slug
    title
      .downcase
      .gsub(/[^a-z0-9]/,'-')
  end
  def filename
    @date.strftime("%F-%H-%M-%S") + "-" + slug + ".md"
  end
  def writable_path
    "/Users/jesse/Projects/til/_posts/#{filename}"
  end
  def save!
    File.write(writable_path, @content)
    puts "Wrote: #{writable_path}"
  end
  def self.add argv
    path = argv.last
    if File.exists? path
      last_post = Dir.glob("_posts/*").last
      date = last_post[7..25]
      image_base = File.basename(argv.last)
      image_path = "images/#{date}-#{image_base}"
      new_path = "/Users/jesse/Projects/til/#{image_path}"
      FileUtils.cp(path, new_path)
      open(last_post, 'a') do |f|
        f << "![](/til/#{image_path})\n"
      end
    else
      raise ArgumentError.new "file not found"
    end
  end
end
