class Farm < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  resourcify
  belongs_to :state
  belongs_to :region
  belongs_to :user 
  attr_accessible :description, :name, :region_id, :state_id, :user_id
end
