class AddLatitudeAndLongitudeToUser < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
		add_column :users, :street, :string
  end
end
