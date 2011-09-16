require 'spec_helper'

describe Comment do
  describe "invalid" do
    it { should be_invalid }
    its(:name) { should be_nil }
    its(:content) { should be_nil }
  end

  describe "valid" do
    subject do
      comment = Comment.new :name => "Nobody In Particular", :content => "Best writer evah!"
    end

    it { should be_valid }
    its(:name) { should == "Nobody In Particular" }
    its(:content) { should == "Best writer evah!" }
  end
end
