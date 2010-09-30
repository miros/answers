class AddAcceptedToAnswer < ActiveRecord::Migration
  def self.up
    add_column :posts, :accepted, :boolean, :default => '0', :null => false
  end

  def self.down
    remove_column :posts, :accepted
  end
end
