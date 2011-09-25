require 'spec_helper'

describe Comment do
  describe "invalid" do
    it { should be_invalid }
    its(:name) { should be_nil }
    its(:content) { should be_nil }
  end

  describe "valid" do
    let(:blog_post) { Factory(:blog_post) }

    subject do
      comment = blog_post.comments.create :name => "Nobody In Particular", :content => "Best writer evah!"
    end

    it { should be_valid }
    its(:name) { should == "Nobody In Particular" }
    its(:content) { should == "Best writer evah!" }

    describe "blog post association" do
      it { should respond_to :blog_post }

      it "should have the right associated blog post" do
        subject.blog_post_id.should == blog_post.id
        subject.blog_post.should == blog_post
      end
    end
  end
end

# == Schema Information
#
# Table name: comments
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  content      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  blog_post_id :integer
#

