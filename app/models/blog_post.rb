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

class BlogPost < ActiveRecord::Base
  attr_accessible :title, :content, :post_date

  validates :title, :presence => true
  validates :content, :presence => true

  has_many :comments, :dependent => :destroy

  def self.get_last_post
    find(:last, :conditions => "post_date IS NOT NULL")
  end

  def self.get_prev_post(blog_post)
    find(:last, :conditions => [ "id < ? and post_date IS NOT NULL", blog_post.id ])
  end

  def self.get_next_post(blog_post)
    find(:first, :conditions => [ "id > ? and post_date IS NOT NULL", blog_post.id ])
  end

  def publish
    # Set the post as published and mark it's publish date as today.
    if self.valid? and not self.post_date?
      self.post_date = Date.today
      self.save
    end
  end

  def publish!
    # Same as above but with exception.
  end

  def published?
    # Return whether this blog post has been published.
    self.post_date
  end
end
