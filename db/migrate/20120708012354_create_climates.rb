class CreateClimates < ActiveRecord::Migration
  def change
    create_table :climates do |t|
      t.string :name
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
