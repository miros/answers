class AddRatingToPostVote < ActiveRecord::Migration
  def self.up
    add_column :post_votes, :rating, :integer 
  end

  def self.down
    remove_column :post_votes, :rating
  end
end
