class Climate < ActiveRecord::Base
	extend FriendlyId 
  friendly_id :name, use: [:slugged,:history]
  resourcify
  attr_accessible :code, :description, :name
end
