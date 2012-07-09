class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :description
      t.integer :region_fk
      t.integer :state_fk
      t.integer :user_fk

      t.timestamps
    end
  end
end
