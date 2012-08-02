class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :description
      t.references :climate
      t.references :country
      t.string :code

      t.timestamps
    end
  end
end
