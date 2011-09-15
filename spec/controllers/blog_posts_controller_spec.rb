require 'spec_helper'

describe BlogPostsController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @blog_post = Factory(:blog_post)
    end

    it "should be successful" do
      get :show, :id => @blog_post
      response.should be_success
    end

    it "should find the right blog post" do
      get :show, :id => @blog_post
      assigns(:blog_post).should == @blog_post
    end

    it "should display the blog post title" do
      get :show, :id => @blog_post
      response.should have_selector("h2", :content => @blog_post.title)
    end

    it "should display the blog post content" do
      get :show, :id => @blog_post
      response.should have_selector("div", :content => @blog_post.content)
    end
  end

  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have a title field" do
      get :new
      response.should have_selector("input#blog_post_title")
    end

    it "should have a content field" do
      get :new
      response.should have_selector("textarea#blog_post_content")
    end

  end

  describe "POST 'create'" do

    context "success" do
      before(:each) do
        @attr = { :title => "Foo", :content => "Bar" }
      end

      it "should create a blog post" do
        expect {
          post :create, :blog_post => @attr
        }.to change { BlogPost.count }.by(1)
      end

      it "should redirect to the blog post show page" do
        post :create, :blog_post => @attr
        response.should redirect_to(blog_post_path(assigns(:blog_post)))
      end

    end

    context "failure" do
      before(:each) do
        @attr = { :title => "", :content => "" }
      end

      it "should not create a blog post" do
        expect {
          post :create, :blog_post => @attr
        }.to change { BlogPost.count }.by(0)
      end

      it "should render the 'new' page" do
        post :create, :blog_post => @attr
        response.should render_template('new')
      end

    end

  end

end
