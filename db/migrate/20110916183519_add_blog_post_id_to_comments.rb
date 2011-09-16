class AddBlogPostIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :blog_post_id, :integer
  end

  def self.down
    remove_column :comments, :blog_post_id
  end
end
