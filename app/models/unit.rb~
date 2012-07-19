class Unit < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  resourcify 
  attr_accessible :description, :name
end
