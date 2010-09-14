class CreateQuestionsAnswers < ActiveRecord::Migration
  def self.up

    create_table :questions_tags, :id => false do |t|
      t.column :question_id, :integer
      t.column :tag_id, :integer
    end

  end

  def self.down
    drop_table :questions_tags
  end
end
