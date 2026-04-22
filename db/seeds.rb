puts "Cleaning database..."
Article.destroy_all
User.destroy_all

puts "Creating 100 users with articles..."
100.times do |i|
  user = User.create!(name: FFaker::Name.name, email: FFaker::Internet.email)

  rand(2..3).times do
    user.articles.create!(title: FFaker::Book.title, body: FFaker::Lorem.paragraphs(3).join("\n\n"))
  end

  print "." if (i + 1) % 10 == 0
end

puts "\nSeed finished! Created #{User.count} users and #{Article.count} articles."
