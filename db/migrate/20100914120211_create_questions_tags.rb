class CreateQuestionsTags< ActiveRecord::Migration
  def self.up

    create_table :questions_tags, :id => false do |t|
      t.column :question_id, :integer, :null => false
      t.column :tag_id, :integer, :null => false

    end

    add_index(:questions_tags, [:question_id, :tag_id])

  end

  def self.down
    drop_table :questions_tags
  end
end
