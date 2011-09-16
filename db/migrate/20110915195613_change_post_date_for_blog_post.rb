class ChangePostDateForBlogPost < ActiveRecord::Migration
  def self.up
    change_column :blog_posts, :post_date, :date
  end

  def self.down
    change_column :blog_posts, :post_date, :datetime
  end
end
