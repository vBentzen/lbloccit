require 'random_data'

#Create unique Post
post = Post.find_or_create_by!(
  title: "Unique Post",
  body: "Unique Body"
)

#Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
#Create a unique Comment
Comment.find_or_create_by!(
post: post,
body: "a super unique comment body"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
