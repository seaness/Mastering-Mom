class Comment < ActiveRecord::Base
  attr_accessible :name, :content

  validates :name, :presence => true
  validates :content, :presence => true

  belongs_to :blog_post
end
