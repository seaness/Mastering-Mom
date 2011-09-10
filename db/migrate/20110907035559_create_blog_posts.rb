class CreateBlogPosts < ActiveRecord::Migration
  def self.up
    create_table :blog_posts do |t|
      t.text :content
      t.datetime :post_date

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_posts
  end
end
