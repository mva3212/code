class State < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  resourcify
  attr_accessible :code, :name
end
