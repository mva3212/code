class AddSlugIndexToJournals < ActiveRecord::Migration
  def change
		add_index :journals, [:slug, :user_id]
  end
end
