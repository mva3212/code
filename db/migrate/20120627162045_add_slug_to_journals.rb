class AddSlugToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :slug, :string
    add_index :journals, :slug
  end
end
