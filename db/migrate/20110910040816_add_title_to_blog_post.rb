class AddTitleToBlogPost < ActiveRecord::Migration
  def self.up
    add_column :blog_posts, :title, :string
  end

  def self.down
    remove_column :blog_posts, :title
  end
end
