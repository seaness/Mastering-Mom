class BlogPost < ActiveRecord::Base
  attr_accessor :title, :content, :post_date

  validates :title, :presence => true
end
