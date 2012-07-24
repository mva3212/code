class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :description
      t.integer :user_id
			t.string :slug
      t.timestamps
    end

    add_index :farms, :slug
  end
end
