class CommentsController < ApplicationController
  def create
    blog_post = BlogPost.find(params[:blog_post_id])
    comment = blog_post.comments.build(params[:comment])
    if comment.save
      # Do something...
    end
  end

  def destroy
  end

end
