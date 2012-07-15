class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
		add_column :users, :state_id, :integer
		add_column :users, :zip, :string
		add_column :users, :country_id, :integer


    add_index :users, :state_id
    add_index :users, :country_id
  end
end
