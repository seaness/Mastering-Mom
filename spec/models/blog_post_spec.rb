require 'spec_helper'

describe BlogPost do

  context "Invalid blog post" do
    it { should_not be_valid }
    its(:title) { should be_nil }
    its(:content) { should be_nil }
  end

  context "Valid blog post" do
    subject do
      blog_post = BlogPost.new :title => "foo", :content => "bar"
      blog_post.save!
      blog_post
    end

    it { should be_valid }
    its(:title) { should == "foo" }
    its(:content) { should == "bar" }
    its(:post_date) { should be_nil }
  end
end
