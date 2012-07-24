class Farm < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  resourcify
  belongs_to :user 
	has_many :journal_farms
	has_many :journals, :through => :journal_farms

  attr_accessible :description, :name, :user_id
end
