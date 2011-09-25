class Comment < ActiveRecord::Base
  attr_accessible :name, :content

  validates :name, :presence => true
  validates :content, :presence => true

  belongs_to :blog_post

  default_scope :order => 'comments.created_at DESC'
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

