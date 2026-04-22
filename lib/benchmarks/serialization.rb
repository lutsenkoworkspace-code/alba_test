require_relative "../../config/environment"
require "benchmark/ips"

users = User.includes(:articles).all

puts "--- Competition is starting! ---"
puts "Users count: #{users.count}"
puts "Total articles count: #{Article.count}"
puts "---------------------------------"

Benchmark.ips do |x|
  x.report("Native to_json") do
    users.to_json(include: :articles)
  end

  x.report("Alba") do
    UserResource.new(users).serialize
  end

  x.compare!
end
