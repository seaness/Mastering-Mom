class BlogPostsController < ApplicationController

  def show
    @blog_post = BlogPost.find(params[:id])
    @comment = @blog_post.comments.build
  end

  def new
    # Should fetch today's blog post if it exists.
    @blog_post = BlogPost.new
  end

  def create
    # Create a new BlogPost based on the parameters passed from new
    @blog_post = BlogPost.new(params[:blog_post])
    if @blog_post.save
      unless params[:publish].nil?
        @blog_post.publish
        redirect_to @blog_post
      else
        redirect_to edit_blog_post_path @blog_post
      end
    else
      render 'new'
    end
  end

  def edit
    # Do we allow editing of an already published post?
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update_attributes(params[:comment])
      unless params[:publish].nil?
        @blog_post.publish
        redirect_to blog_post_path @blog_post
      end
    end
  end

end
