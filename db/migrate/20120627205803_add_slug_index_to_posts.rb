class AddSlugIndexToPosts < ActiveRecord::Migration
  def change
		add_index :posts, [:slug, :journal_id]
  end
end
