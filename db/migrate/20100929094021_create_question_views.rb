class CreateQuestionViews < ActiveRecord::Migration
  def self.up
    create_table :question_views do |t|
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :question_views
  end
end
