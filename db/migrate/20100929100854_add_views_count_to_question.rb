class AddViewsCountToQuestion < ActiveRecord::Migration
  def self.up
    add_column :posts, :question_views_count, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :posts, :question_views_count
  end
end
