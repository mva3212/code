class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :description
      t.references :user
			t.string :slug
      t.timestamps
    end
		add_index :farms, :user_id
    add_index :farms, :slug
  end
end
