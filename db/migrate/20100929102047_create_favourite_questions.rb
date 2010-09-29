class CreateFavouriteQuestions < ActiveRecord::Migration
  def self.up
    create_table :favourite_questions do |t|
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end

  def self.down
    drop_table :favourite_questions
  end
end
