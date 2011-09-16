# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer         not null, primary key
#  content    :text
#  post_date  :date
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

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

    it "should not be published" do
      subject.should_not be_published
    end

    it "should have today's date when published" do
      subject.publish
      subject.post_date.to_date.should == Date.today
    end
  end
end
