require 'spec_helper'

describe BlogPost do
  before(:each) do
    @attr = { :title => "Example Post", :content => "This is a test blog post." }
  end

  it "should create a new instance given valid attributes" do
    BlogPost.create!(@attr)
  end
end
