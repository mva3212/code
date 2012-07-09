class CreateCropStrains < ActiveRecord::Migration
  def change
    create_table :crop_strains do |t|
      t.string :name
      t.string :description
      t.integer :crop_type_id
      t.string :extra_info

      t.timestamps
    end
  end
end
