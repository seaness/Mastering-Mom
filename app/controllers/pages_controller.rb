class PagesController < ApplicationController
  def home
    @blog_post = BlogPost.find(:last, :conditions => "post_date IS NOT NULL")
    if @blog_post
      @comment = @blog_post.comments.build
      render 'blog_posts/show'
    else
      # PANIC!!! NO POSTED CONTENT!!!
      raise NotImplementedError
    end
  end

end
