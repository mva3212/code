class Region < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  resourcify
  belongs_to :climate
  belongs_to :country
  attr_accessible :climate_id, :code, :country_id, :description, :name
end
