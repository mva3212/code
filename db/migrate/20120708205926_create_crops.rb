class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.string :name
      t.string :description
      t.timestamp :planted_date
      t.integer :crop_strain_id
      t.integer :seed_count
      t.integer :farm_id

      t.timestamps
    end
  end
end
