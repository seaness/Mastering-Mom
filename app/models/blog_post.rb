class BlogPost < ActiveRecord::Base
  attr_accessible :title, :content, :post_date

  validates :title, :presence => true
  validates :content, :presence => true

  def publish
    # Set the post as published and mark it's publish date as today.
  end

  def publish!
    # Same as above but with exception.
  end

  def published?
    # Return whether this blog post has been published.
  end
end
