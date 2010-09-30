class RemoveViewsCountFromPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :views_count
  end

  def self.down
    add_column :posts, :views_count, :integer, :null => false, :default => 0
  end
end
