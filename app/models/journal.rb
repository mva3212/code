class Journal < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  resourcify
  belongs_to :user
  belongs_to :journal_type
	has_many :journal_farms
	has_many :farms, :through => :journal_farms
  attr_accessible :description, :is_primary, :name, :user_id, :journal_type_id
end
