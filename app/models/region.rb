class Region < ActiveRecord::Base
  resourcify
  belongs_to :climate
  belongs_to :country
  attr_accessible :climate_id, :code, :country_id, :description, :name
end
