class CreatePostVotes < ActiveRecord::Migration
  def self.up
    create_table :post_votes do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :post_votes
  end
end
