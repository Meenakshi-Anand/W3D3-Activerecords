class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.integer :topic_id, null: false
      t.integer :url_id, null: false
      t.timestamps
    end
    add_index :taggings, [:topic_id, :url_id], unique: true
  end
end
