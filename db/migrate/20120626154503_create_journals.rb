class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :name
      t.text :description
      t.references :user
      t.references :journal_type
      t.boolean :is_primary

      t.timestamps
    end
    add_index :journals, :user_id
    add_index :journals, :journal_type_id
  end
end
