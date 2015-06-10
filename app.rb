#!/usr/bin/ruby

require_relative './parser'
require_relative './notifier'

base_url = 'https://www.reddit.com/r/'
old_ids = './.ids'

if ARGV.empty?
    puts "You need to specify a subreddit." 
else
    url = "#{base_url}#{ARGV[0]}.json"
    
    data = Parser.new url
    posts = data.posts

    old_id_list = File.readlines(old_ids).each {|l| l.chomp!}
    n = Notifier.new old_ids

    posts.each do |p|
        n.notify p unless old_id_list.include? p['id']
    end
end