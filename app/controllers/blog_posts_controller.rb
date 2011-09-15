class BlogPostsController < ApplicationController

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    # Should fetch today's blog post if it exists.
    @blog_post = BlogPost.new
  end

  def create
    # Create a new BlogPost based on the parameters passed from new
    @blog_post = BlogPost.new(params[:blog_post])
    if @blog_post.save
      redirect_to @blog_post
    else
      render 'new'
    end
  end

end
