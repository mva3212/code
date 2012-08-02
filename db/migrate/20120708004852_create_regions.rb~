class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :description
      t.integer :climate_id
      t.integer :country_id
      t.string :code

      t.timestamps
    end
  end
end
