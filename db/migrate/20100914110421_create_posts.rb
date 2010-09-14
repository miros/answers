class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.string :type

      t.integer :user_id
      t.integer :rating
      t.string :title
      t.string :slug
      t.text :text

      t.integer :views_count

      t.timestamps

      ## Question

      t.integer :answers_count

      ## Answer

      t.integer :question_id     

    end
  end

  def self.down
    drop_table :posts
  end
end
