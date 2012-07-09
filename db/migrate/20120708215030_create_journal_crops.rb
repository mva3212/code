class CreateJournalCrops < ActiveRecord::Migration
  def change
    create_table :journal_crops do |t|
      t.integer :journal_id
      t.integer :crop_id

      t.timestamps
    end
  end
end
