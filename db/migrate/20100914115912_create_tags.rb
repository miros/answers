class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name, :null => false
      t.text :slug, :null => false
      t.integer :questions_count, :null => false, :default => 0

      t.timestamps

    end

    add_index(:posts, :slug)

  end

  def self.down
    drop_table :tags
  end
end
