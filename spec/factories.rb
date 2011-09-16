Factory.define :blog_post do |blog_post|
  blog_post.title       "Test blog post"
  blog_post.content     "Lorem ipsum dolor"
end

Factory.define :comment do |comment|
  comment.name          "Who Knows"
  comment.content       "Best blog post evah!"
  comment.association   :blog_post
end