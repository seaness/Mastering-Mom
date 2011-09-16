require 'spec_helper'

describe CommentsController do

  describe "POST 'create'" do
    context "success" do
      before(:each) do
        @blog_post = Factory(:blog_post)
        @attr = { :name => "Commentor", :content => "Comment" }
      end

      it "should create a new comment" do
        expect {
          post :create, :comment => @attr, :blog_post_id => @blog_post
        }.to change { Comment.count }.by(1)
      end
    end
  end

  describe "DELETE 'destroy'"

end
