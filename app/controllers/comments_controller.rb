class CommentsController < ApplicationController
  def create
    @blog_post = BlogPost.find(params[:comment][:blog_post_id])
    @comment = @blog_post.comments.build(params[:comment]).save!
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render do |page|
        page << '$("new_comment").reset();'
        page.replace_html 'comment_list', :partial => 'shared/comment', :collection => @blog_post.comments
      end}
    end
  end

  def destroy
  end

end
