class CreateJournalFarms < ActiveRecord::Migration
  def change
    create_table :journal_farms do |t|
      t.integer :journal_id
      t.integer :farm_id

      t.timestamps
    end
  end
end
