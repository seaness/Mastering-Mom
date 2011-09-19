class PagesController < ApplicationController
  def home
    @blog_post = BlogPost.find(:last, :conditions => "post_date IS NOT NULL")
    if @blog_post
      @comment = @blog_post.comments.build
      @prev_post = BlogPost.get_prev_post @blog_post
      @next_post = BlogPost.get_next_post @blog_post
      render 'blog_posts/show'
    else
      # PANIC!!! NO POSTED CONTENT!!!
      raise NotImplementedError
    end
  end

end
