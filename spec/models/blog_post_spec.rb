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
      BlogPost.create :title => "foo", :content => "bar"
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

    describe "comment association" do
      it { should respond_to :comments }

      it "should destroy comments when deleted" do
        bp = BlogPost.create :title => "Destroy", :content => "Destroy"
        comment = Factory(:comment, :blog_post => bp)
        bp.destroy
        Comment.find_by_id(comment.id).should be_nil
      end
    end
  end
end
