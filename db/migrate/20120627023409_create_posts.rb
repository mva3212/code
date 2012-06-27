class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.references :journal

      t.timestamps
    end
    add_index :posts, :journal_id
  end
end
