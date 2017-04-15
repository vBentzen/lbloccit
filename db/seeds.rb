require 'random_data'

# Create Topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Sponsored_Posts
20.times do
  SponsoredPost.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: 50
  )
end
# Create Posts
50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{SponsoredPost.count} sponsored_posts created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"