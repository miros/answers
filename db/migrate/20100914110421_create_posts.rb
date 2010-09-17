class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.string :type

      t.integer :user_id, :null => false
      t.integer :rating, :null => false, :default => 0
      t.string :title
      t.string :slug
      t.text :text, :null => false

      t.integer :views_count, :null => false, :default => 0

      t.timestamps

      ## Question

      t.integer :answers_count, :null => false, :default => 0

      ## Answer

      t.integer :question_id, :null => false, :default => 0     

    end

    add_index(:posts, :user_id)
    add_index(:posts, :slug)
  end

  def self.down
    drop_table :posts
  end
end
