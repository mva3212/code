class CreateHarvestDetails < ActiveRecord::Migration
  def change
    create_table :harvest_details do |t|
      t.string :name
      t.string :summary
      t.timestamp :harvest_date
      t.decimal :total_wet_yield
      t.decimal :total_dry_yield
      t.integer :yield_unit_id
      t.string :notes

      t.timestamps
    end
  end
end
